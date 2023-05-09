import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class w_01_logistic_05 extends PApplet {

/*

 У Шпрота есть код, но он на бэйсике, ётпа. Попробуем изобрести то же (или по
 смыслу то же), но на процессинге.
 
 Там не флоаты, а доблы, но ХЗ, может в нашем флоате байт больше, чем в их дабле
 93-го года выпуска. Я не слишком много матерюсь?
 
 Врубаем отрисовку, видим не совсем то, что на диаграмме "мистера смоковницы".
 Похоже, но не то? Может, дело в доблах? Нет, не в доблах. А в чём? Откуда
 дребезг? Вы кстати понимаете, что в коде творится? надо объяснять или так
 сойдёт? Мы засыпаем рандомами исходные значения и по сто раз их обсчитываем.
 Этот подход называется "метод монте-карло" или 
 "метод статистического моделирования", он дешев и он сердит.
 
 Отрисовка до информативной картинки занимает минут пять, можно врубить и пока
 оно генерится читать тексты. То, что получится у Шпрота называется "рисунок
 1-1 диаграмма бифуркаций логистического уравнения". Что такое "бифуркация"
 объясню позже. Ну или сейчас: бифуркация это раздвоение результата на два
 возможных варианта. И в момент бифуркации происходит всякое интересное.
 
 А.. Оказалось, нужно отрисовывать не каждую итерацию, а решение, к которому всё
 это дело сходится (т.е. выводить точку каждый кадр только после 1000 итераций
 цикла for). Плохой код я закоментил, вы можете его раскоментить и посмотреть
 какое здесь было безобразие.
 
 Ну вот, отрисовали красивое, теперь можно и к теории вернуться, теория штука
 важная, её нужно изучить, чтобы потом не спотыкаться об неё на каждом шагу
 (как говаривал бывалочи Володя Ульянов-Ленин). 
 
 */


public void setup() {
  
  background(0);
  stroke(255);
  strokeWeight(1);
}


public void draw() {
  float R = random(2, 4);
  float x = random(0, 1);
  float x_new;
  for (int i=0; i<1000; i++) {
    x_new = R * x * (1 - x);
    x = x_new;
    //float x_point = map(R, 2, 4, 0, width);
    //float y_point = map(x, 0, 1, height, 0);
    //point(x_point, y_point);
  }
  float x_point = map(R, 2, 4, 0, width);
  float y_point = map(x, 0, 1, height, 0);
  point(x_point, y_point);
}

/* 
То, что получилось, называется "Бифуркационная диаграмма логистического отображения".
Это если вы любитель точности.
*/
  public void settings() {  size(600, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "w_01_logistic_05" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
