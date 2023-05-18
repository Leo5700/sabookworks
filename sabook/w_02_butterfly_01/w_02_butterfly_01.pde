/*

Прости господи, "эффект бабочки".
Опробуем-ка новую технологию, описния переместим в .md рядом со скетчём.

 */


void setup() {
  //size(600, 400);
  fullScreen();
  background(0);
}


void draw() {
  '''
  for (int j=0; j<5000; j++) {
  float R = random(2, 4);
  float x0 = random(0, 1);
  float x_new;
  float x = x0;
  for (int i=0; i<1000; i++) {
  x_new = R * x * (1 - x);
  x = x_new;
}
  float xres = x;
  float x_point = map(R, 2, 4, 0, width);
  float y_point = map(xres, 0, 1, height, 0);
  strokeWeight(0.5); // полпикселя, чтобы границы были сглажены
  stroke(255, 30);
  point(x_point, y_point);

  stroke(map(xres, 0, 1, 0, 255), 0, 0); // оттенок красного
  float y_x0_point = map(x0, 0, 1, height, 0);
  point(x_point, y_x0_point);
}
  '''
}


/*



 */

