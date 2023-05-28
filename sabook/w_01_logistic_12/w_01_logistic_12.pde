
/*

как из одномерного преобразования сделать двумерное отображение? 
можно решить уравнение дважды с разными исходными данными, 
а можно поступить ещё круче - в качестве второго измерения 
использовать предыдущее решение, почему бы и нет? раз мы берём 
экспоненту Ляпунова больше единицы, значит решения все хаотические, 
значит ответы рсходятся, значит предыдущее решение переходит в следующее 
с потерей информации, значит в координатах "прошлое-настоящее" мы
увидим точно не точку и не линию, а нечто интересное, а что именно 
мы сейчас увидиим

оставим пока два измерения, так можно будет отрисовать побольше точек,
например, тысяч сто (для моего ископаемого ноута это очень не мало, 
приходится прибегать к хитростям: opengl (fullScreen(P2D)) и квадратные 
точки (strokeCap(PROJECT))).

*/


float base;


void setup() {
  fullScreen(P2D);
  background(0);
  stroke(255);
  strokeWeight(1);
  strokeCap(PROJECT);

  base = min(width, height);
}


float r;
float rmin = 3.45; //
float rmax = 4;
float x0min = 0;
float x0max = 1;
float x, x0, xnew;
float se, L;
float sh = 0;

int n = 100000; //
float[] xs = new float[n];
float[] xsprev = new float[n];

float px, py, pz;

float deg = PI/180;


void draw() {
  translate(width*.5, height*.5);
  background(0);

  for (int j=0; j<10; j++) {
    sh += 0.01;
    r = map(noise(sh), 0, 1, rmin, rmax);
    x0 = map(noise(sh+100), 0, 1, x0min, x0max);

    x = x0;
    se = 1; //!

    for (int i=0; i<n; i++) {
      xnew = r * x * (1 - x);
      x = xnew;
      xs[i] = x;
      se += log2(abs(r*(1-2*x))); // сумма для экспоненты Ляпунова
    }

    L = se/n; // экспонента Ляпунова

    if (L > -.5) { //
      float minxs = min(xs);
      float maxxs = max(xs);
      float minxsprev = min(xsprev);
      float maxxsprev = max(xsprev);

      for (int i=0; i<n; i++) {
        px = map(xs[i], minxs, maxxs, -base*.5, base*.5);
        py = map(xsprev[i], minxsprev, maxxsprev, base*.5, -base*.5);
        point(px, py);
      }
      arrayCopy(xs, xsprev);
      break;
    }
  }
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

что же дальше? дальше будет звук

*/
