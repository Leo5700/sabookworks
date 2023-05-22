/*

 см. comments.md
 
 */


void setup() {
  size(800, 600);
  //fullScreen();
  background(0);
  stroke(255);
  strokeWeight(1);
}


void draw() {
  float R;
  float Rmin=2;
  float Rmax=4;

  for (int j=0; j<500; j++) { // отрисовка точек по k штук
    R = random(Rmin, Rmax);
    float x = random(0, 1);

    float x_new;
    float sum=1;
    int N = 10000;
    for (int i=0; i<N; i++) {
      x_new = R * x * (1 - x);
      x = x_new;
      sum += log2(abs(R*(1-2*x))); // вычисление экспоненты Ляпунова
    }
    float L = sum/N;
    float x_point = map(R, Rmin, Rmax, 0, width);
    float y_point = map(x, 0, 1, height, 0);
    float L_point = map(L, -1, 1, height, 0);
    strokeWeight(1);
    stroke(255); // белые точки - диаграмма Фейгенбаума
    point(x_point, y_point);
    stroke(0, 255, 0); // зелёные точки - значения экспоненты Ляпунова
    if (abs(L) < 0.01) {
      strokeWeight(4);
      stroke(255, 0, 0);} // красные точки - L вблизи нуля
    point(x_point, L_point);
  }
  strokeWeight(0.1);
  stroke(100);
  line(0, height*.5, width, height*.5); // горизонтальная линия
}


float log2(float x) {
  /*
  Функция для вычисления логарифма по основанию "2" (на основе встроеннй 
   функции, вычисляющей логарифм по основанию "e=2.718281828" и прикольного 
   свойства логарифмов)
   log_2 (x) = log_y (x) / log_y (2)
   https://stackoverflow.com/questions/3064926/how-to-write-log-base2-in-c-c
   */
  float M_LOG2E = 1.44269504088896340736; // log2(e)
  return log(x) * M_LOG2E;
}


/* 
 
 --==--
 
 */
 
