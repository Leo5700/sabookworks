/*

 Каждый случай раздвоения решения (как мы уже знаем) называется "бифуркацией",
 возможно, потому что "би" это би, а "fork" это "вилка"
 (по латыни "вилка" - "furk", так что вообще всё сходится).
 
 Когда "дорога раздвояется", такая бифуркация называется "pitchfork
 bifurcation", где "pitchfork" - это "вилы". Ну что тут скажешь, вилы так вилы.
 А вот извольте-ка посмотреть, есть ещё один тип бифуркации -- вы ведь заметили
 дыры в правой части графика? "А в другие две дыры -- виртуальные миры".. В
 общем, это тоже бифуркация, но не вилочная, а более хитрая - "тангенциальная"
 или "в-форме-седла" (возможно, она же "суперкритическая", но это не точно).
 
 По мере продвижения слева направо по диаграмме бифуркаций видно увеличение
 скорости удвоения решений, причём (что интересно) удвоение это кратно числу
 4.6692, которое называется "числом Фейгенбаумана". Что ещё интереснее, число
 Фейгенбаума нет-нет да и появляется в динамических системах из самых разных
 областей моделирования природных процессов. Примерно как число Pi
 (3.14159265357978) в евклидовой геометрии.
 
 Если углубиться в исследование правой части нашей любимой (и пока единственной)
 диаграммы, можно заметить, что хаос там не такой уж и хаос и при фиксированных
 значениях исходного X сходится к парам значений или тройкам значений (или к
 чему-то ещё), но не к полной каше. 
 
 Что там к чему сходится Шпрот в своей книге нам не показывает, потому что
 книжка это сугубо двумерная штука, так что сейчас мы с вами будем строить
 трёхмерную диаграмму бифуркаций и ничто помешать в этом нам не сможет, даже
 отсутствие пива. Кстати, прошу запомнить пароль: "пиво необходимо", как
 нибудь, я расскажу байку про аэрокосмический факультет МГТУ имени Никоная
 Эрнестовича Баумана и "индекс подушкина".
 
 А сейчас, внимание на экран и да поможет нам OpenGL.
 
 */


int n_R = 600; // 200..1000 
int n_x0 = 200; // 200..500 
int N = 1000;

FloatList x_ps = new FloatList(); 
FloatList y_ps = new FloatList(); 
FloatList
  z_ps = new FloatList();

int n = 0;

void setup() { 
  size(600, 400, P3D); 
  frameRate(25); 
  strokeCap(PROJECT); 
  stroke
    (255, 200); 
  strokeWeight(1);

  float x_new; 
  float x;

  // здесь всё считаем
  for (float R=2; R<4; R+=2./n_R) { 
    for (float x0=0.0001; x0<1; x0+=1./n_x0) { 
      x
        = x0; 
      for (int i=0; i<N; i++) { 
        x_new = R * x * (1 - x); 
        x = x_new;
      }
      x_ps.append(map(R, 2, 4, 0, width)); 
      y_ps.append(map(x, 0, 1, height, 0));
      z_ps.append(map(x0, 0, 1, 0, 200)); //

      n++;
    }
  } 
  println ("число точек для отрисовки:", n);
}


void draw() { 
  background(0);

  // вращаем координаты
  translate(width*.5, height*.5, 100); 
  rotateY(frameCount*.01); 
  translate
    (-width*.5, -height*.5, -100);

  // здесь всё рисуем
  for (int i=0; i<n; i++) { 
    point(x_ps.get(i), y_ps.get(i), z_ps.get(i));
  }
}


/* 
 
 Что в итоге? Вы видите, что ничего не видно -- а почему -- вы сейчас увидите.
 
 Мы хотели удостовериться, что в правой части диаграммы живёт не сплошной хаос,
 а вместо этого видим полный мрак, но, вместе с этим, интересное поведение
 диаграммы (или теперь правильнее её называть "триаграммой"? Осей-то стало три
 а не две) в зависимости от исходного значения X. Видны интереснейшие рукава,
 причём, симметричные относительно значения 0.5. Также видно, что смена рукавов
 происходит не мгновенно, хотя и очень резко. А ещё видно, что хаос нарастает
 не только вправо, но и по "глубине" исходного X и нужна сильно борзая ПЭВМ
 (персональная электронно-вычислительная машина), чтобы детализироовать правую
 часть достаточно хорошо.
 
 В следующем скетче всё-таки прочешем правую часть регулярной сеткой, надо
 увидеть хоть один срез по исходному X, но увидеть его хорошо.
 
 */
