/*

 В мире много уравнений, вот например интересное и простое. Допустим, положили
 вы в банк бабла под проценты и ждёте что будет. Или там, какие-то насекомые
 размножаются, или люди - не суть, математика везде одинаковая:
 

 X_n+1 = R * X_n    (уравнение 1A)
 

 где X - это деньги или насекомые или что ещё, коэффициент R, больший 1 это,
 собственно, проценты по вкладу, R = 1.1 значит, что вы получите 10% годовых.
 Или насекомых через год станет на 10% больше, или народонаселения. n это
 текущий год, n+1 это следующий год.
 

 Следующий год = коэффициент * этот год    (уравнение 1A на человеческом)
 

 Если мы хотим посчитать, сколько бабок будет на счету через много лет,
 например, через 50, уравнение будет выглядеть так: 


 X_n = X_0 * R^n    (уравнение 1B) 
 энный год = нулевой год * коэффициент в степени n

 
 Через 50 лет на каждый рубль, вложенный под 10% вы получите 117.39 деревянных,
 если их инфляция не сожрёт (то бишь в деньгах текущего года).
 
 Такой рост, рост по уравнению 1B называется "экспоненциальным" ростом. В
 природе, чтобы жуки не заполняли весь земной шар или капиталисты не богатели
 как черти, имеются некоторые естественные ограничения, наверное, вы
 догадываетесь о них и без меня.
 
 Немного поменяем правила игры, дополним правую часть уравнения ограничивающим 
 множителем (X - 1). 
 
 Получится так называемое "логистическое уравнение": 
 

 X_n+1 = R * X_n * (1 - X_n)    (уравнение 1C)
 

 Кстати, в википедии написано: "не понятно, почему автор этого уравнения, некто
 Ферхюльст назвал его именно "логистическим". А вообще, если уж гуглить, то
 гуглить "логистическое отображение", но не суть, не будем углубляться. 
 
 Посчитаем-ка лучше логистическое уравнение, настало время чего-нибудь 
 посчитать.
 
 Запускай скетч, смотри что в консоли:
 1 0.1
 2 0.17999999
 3 0.2952
 4 0.4161139
 5 0.48592624
 6 0.49960384
 7 0.49999964
 8 0.5
 9 0.5
 
 Видно, что через 8 итераций решение сошлось к значению 0.5
 
 Хмм.. интересно, зачем всё это? Расскажу чуть позже.
 
 Дальше Шпрот пишет нам: This process is called iteration and the successive
 values are called iterates. Как это прикажете перевести? Про процесс итерации
 понятно, не понятно как переводить этих мать его "итератов"? Итеранты
 шмитеранты.. Пусть будут "результаты итерации", зубодробительно, таков он -
 великий, могучий и непобедимый.
 
 */


void setup() {
  float x = 0.1;
  float R = 2;
  for (int i = 1; i < 10; i++) {
    println(i, x);
    float x_next = R * x * (1 - x);
    x = x_next;
  }
}


void draw() {
  text("зырь в консоль", 2, 20);
}
