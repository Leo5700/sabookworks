

import processing.sound.*;
int deviceId = 0; // номер устройства входа (Sound.list())
AudioIn input;
Amplitude loudness;
float vol;


void FilVol_setup() {
  Sound.list();
  input = new AudioIn(this, deviceId); //
  input.start();
  loudness = new Amplitude(this);
  loudness.input(input);
}


class FilVol {

  float maxvol = -1000;
  float minvol = 1000;
  float volnorm;
  float volnormfiltered = 0;
  float smooth = 0.05; // 0..1

  PGraphics pg;
  int pg_size = 200; // размер отрисовки

  void init() {
    pg = createGraphics(pg_size/4, pg_size);
  }

  void setSmooth(float smooth_) {
    smooth = smooth_;
  }

  void calculate() {
    if (input != null) {
      // получение, нормализация, фильтрация входного потока
      vol = loudness.analyze();
      if (vol > maxvol)
        maxvol = vol;
      if (vol < minvol)
        minvol = vol;
      maxvol *= 0.99;
      minvol *= 1.01;

      volnorm = map(vol, minvol, maxvol, 0, 1);

      if (volnorm == volnorm) // not NaN
        volnormfiltered += (volnorm - volnormfiltered) * smooth;
      volnormfiltered = constrain(volnormfiltered, 0, 1);
    }
  }

  void display() {
    // отрисовка
    pg.beginDraw();
    pg.background(150);
    pg.rectMode(CORNERS);

    pg.stroke(0, 200);
    pg.noFill();
    pg.rect(0, pg.height, pg.width, map(volnorm, 0, 1, pg.height, 0));

    pg.fill(0, 100);
    pg.noStroke();
    pg.rect(0, pg.height, pg.width, map(volnormfiltered, 0, 1, pg.height, 0));

    pg.fill(255);
    pg.text(vol, 2, 12);
    pg.text(volnorm, 2, 24);
    pg.text(volnormfiltered, 2, 36);

    pg.text(smooth, 2, 60);
    pg.endDraw();
    image(pg, 0, 0);
  }
}
