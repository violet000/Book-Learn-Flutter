/*
  dart运算符
*/

void main() {
  const a = 13;
  const b = 5;

  // 算术运算符
  print(a + b); // 加 18
  print(a - b); // 减 8
  print(a * b); // 乘 65
  print(a / b); // 除 2.6
  print(a % b); // 取余 3
  print(a ~/ b); // 取整 2

  // 关系运算符
  print(a == b); // 判断是否相等 false
  print(a != b); // 判断是否不相等 true
  print(a > b); // 判断是否大于 true
  print(a < b); // 判断是否小于 false
  print(a >= b); // 判断是否大于等于 true
  print(a <= b); // 判断是否小于等于 false

  // 逻辑运算符
  print(a > b && a < b); // 与 false
  print(a > b || a < b); // 或 true
  print(!(a > b)); // 非 false

  // 赋值运算符
  double c = 13;
  c += 5; // c = c + 5;
  print(c); // 18
  c -= 5; // c = c - 5;
  print(c); // 13
  c *= 5; // c = c * 5;
  print(c); // 65
  c /= 5; // c = c / 5;
  print(c); // 13.0
  c %= 5; // c = c % 5;
  print(c); // 3.0
  // c ~/= 5; // c = c ~/ 5;
  // print(c); // 0

  // 条件运算符
  print(a > b ? 'a大于b' : 'a小于b'); // a大于b
  // print(a > b? 'a大于b' : 'a小于b' : 'a等于b'); // 报错

  // 类型转换
  print(a.toString()); // 13
  print(a.toDouble()); // 13.0
  print(a.toInt()); // 13

  // 类型判断
  print(a is int); // true
  print(a is double); // false
  print(a is String); // false

  // as 运算符
  print((a as int).toString()); // 13.0

  // is! 运算符
  print(a is! int); // false

  //??= 运算符
  int f = 13;
  f ??= 5; // f存在就使用f，否则就用5
  print(f); // 13
  var g = null;
  g ??= 5; // g存在就使用g，否则就用5
  print(g); // 5

  // ?? 运算符
  int d = 13;
  var e = null;
  print(e ?? d); // 13 e存在就使用e，否则就用d
  print(d ?? e); // 13

  // isNaN 运算符
  print(1 / 0); // Infinity
  print(1 / 0 is double); // true
  print(a.isNaN); // false
}
