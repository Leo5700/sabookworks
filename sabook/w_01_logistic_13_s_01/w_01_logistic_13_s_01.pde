
/*

 понадобиться установить библиотеку sound
 https://processing.org/reference/libraries/sound/index.html 

 двумерный хаос из одномерного также можно извлечь, решив уравнение дважды.
 
 */


float base;

FilVol fv = new FilVol();


void setup() {
  fullScreen(P2D);
  background(0);
  stroke(255);
  strokeWeight(1);
  strokeCap(PROJECT);
  noCursor();

  base = min(width, height);

  FilVol_setup();
  fv.init();
  fv.setSmooth(0.42); //
}


float r;
float rmin = 3.45; //
float rmax = 4;
float x0min = 0;
float x0max = 1;
float x, x0, xnew;
float se, L;
float sh = 0;

int n = 50000; //

//float[] xsprev = new float[n];

float px, py, pz;

float deg = PI/180;


void draw() {

  background(0);

  fv.calculate(); ///
  fv.display(); ///

  translate(width*.5, height*.5);

  float[] xs = getX(0);
  float[] ys = getX(1000);

  float minxs = min(xs);
  float maxxs = max(xs);
  float minys = min(ys);
  float maxys = max(ys);

  for (int i=0; i<xs.length; i++) {
    px = map(xs[i], minxs, maxxs, -base*.5, base*.5);
    py = map(ys[i], minys, maxys, base*.5, -base*.5);
    point(px, py);
  }
}


float[] getX(float sh_sh) {

  float[] xs = new float[n];

  for (int j=0; j<10; j++) { // 10 попыток поиска неустойчивого решения
  
    sh += 0.001 + fv.volnormfiltered * 0.003; //
    r = map(noise(sh+sh_sh), 0, 1, rmin, rmax);
    x0 = map(noise(sh+sh_sh+100), 0, 1, x0min, x0max);

    x = x0;
    se = 1; //!

    for (int i=0; i<n; i++) {
      xnew = r * x * (1 - x);
      x = xnew;
      xs[i] = x;
      se += log2(abs(r*(1-2*x))); // сумма для экспоненты Ляпунова
    }

    L = se/n; // экспонента Ляпунова

    //int count = int(map(fv.volnormfiltered, 0, 1, n*0.92, n)); //

    if (L > -.5) { //

      //arrayCopy(xs, xsprev);
      break;
    }
  }
  return xs;
}


float log2(float x) {
  /*
   log2 (x) = logy (x) / logy (2)
   https://stackoverflow.com/questions/3064926/how-to-write-log-base2-in-c-c
   */
  float M_LOG2E = 1.44269504088896340736; // log2(e)
  return log(x) * M_LOG2E;
}


/*

 
 
 */
