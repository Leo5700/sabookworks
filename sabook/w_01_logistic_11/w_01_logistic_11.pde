
/*

код.. 

вход тот же, преобразование то же, отображение - гончарый круг

*/


void setup() {
  //size(800, 600, P3D);
  fullScreen(P3D);
  background(0);
  stroke(255, 100);
  strokeWeight(1);
  noCursor();
}

float R;
float x = 0.5;
float x_new;
float y;
float deg = PI/180;
float k1, k2;


void draw() {
  translate(width*.5, height*.5);
  rotateX(60*deg);

  R = random(2, 4);
  
  if (keyPressed || mousePressed || frameCount == 1 || frameCount%1750 == 0){
   k1 = random(0.1, 1);
   k2 = random(0.1, 1);
   background(0);
  }
    
  for (int j=0; j<1000; j++) {
    x_new = R * x * (1 - x);
    x = x_new;
    y = random(0, 1);

    float xp = map(x, 0, 1, -height*k1, height*k2);
    float yp = map(y, 0, 1, 0, TWO_PI);
    float zp = map(R, 2, 4, -height*.6, height*.4);

    pushMatrix();
    rotate(yp);
    point(xp, 0, zp);
    popMatrix();
  
  }
}
