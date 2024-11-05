/*
  dart循环语句
*/

void main() {
  // ++ -- 自增自减
  var a = 1;
  print(++a); // 2
  print(a++); // 2
  print(a); // 3

  int b = 2;
  int c = b++;
  print(b); // 3
  print(c); // 2

  int d = 2;
  int e = ++d;
  print(d); // 3
  print(e); // 3

  // 循环语句
  // 打印结果：0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50
  for (int i = 0; i <= 50; i++) {
    if (i % 2 == 0) {
      print('$i');
    }
  }

  // while循环
  // 打印结果：0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50
  int i = 0;
  while (i <= 50) {
    if (i % 2 == 0) {
      print('$i');
    }
    i++;
  }

  // do while循环
  int j = 0;
  do {
    if (j % 2 == 0) {
      print('$j');
    }
    j++;
  } while (j <= 50);

  // for in循环
  // 打印结果：1 2 3 4 5
  var l1 = [1, 2, 3, 4, 5];
  for (var item in l1) {
    print(item);
  }

  // for each循环
  // 打印结果：1 2 3 4 5
  var l2 = [1, 2, 3, 4, 5];
  l2.forEach((item) {
    print(item);
  });

  // break和continue
  // 打印结果：0 2 4 6 8 10
  for (int i = 0; i <= 50; i++) {
    if (i % 2 == 0) {
      print('$i');
    }
    if (i == 10) {
      break; // 当i==10时退出循环
    }
  }

  // 打印结果： 0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50
  for (int i = 0; i <= 50; i++) {
    if (i % 2 == 0) {
      print('$i');
    }
    if (i == 10) {
      continue;
    }
  }

  // switch case
  // 结果：a1 = 1
  var a1 = 1;
  switch (a1) {
    case 1:
      print('a1 = 1');
      break;
    case 2:
      print('a1 = 2');
      break;
    case 3:
      print('a1 = 3');
      break;
    default:
      print('a1 = 4');
      break;
  }

  // 三元运算符
  // 结果：2
  var a2 = 1;
  var b2 = 2;
  var c2 = a2 > b2 ? a2 : b2;
  print(c2);
}
