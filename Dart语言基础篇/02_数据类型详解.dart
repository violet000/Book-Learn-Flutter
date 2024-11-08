/*
  Dart数据类型：(可以通过is 关键字判断数据类型)
  1. 数字类型 int、double
  2. 字符串类型 String
  3. 布尔类型 bool
  4. 数组类型 List
  5. 集合类型 List
  6. 映射类型 
  7. 空类型 
  8. 动态类型
*/

void main() {
  String str = 'simple';
  print(str);

  // 多行字符串
  String temp = '''
    123
    456
    789
  ''';
  print(temp);

  // 字符串拼接
  String str1 = 'hello';
  String str2 = 'dart';

  print('$str1 $str2');

  // 字符串拼接方法二
  String str3 = 'hello';
  String str4 = 'dart';

  print(str3 + ' ' + str4);

  // int类型
  int a = 13;
  a = 34;
  // a = 2.3; 不能将double类型赋值给int类型
  print(a);

  // double类型
  double b = 13.14;
  b = 40; // 可以将int类型赋值给double类型
  print(b); // 40.0

  var c = a + b;
  print(c);

  // bool类型
  bool d = true;
  d = false;
  print(d);

  // 第一种定义List的方式 可以去修改数组的长度
  var l1 = [1, 2, 3, 4, 5];
  print(l1);
  print(l1.length);
  print(l1[0]);

  // 第二种定义List的方式（指定数组类型）
  var l2 = <String>['1', '2', '3', '4'];
  print(l2);
  print(l2.length);
  print(l2[0]);

  l2.add('5');
  print(l2.length);

  // 第三种定义List的方式, 已经被弃用
  // var l3 = new List();
  // l3.add('1');
  // l3.add('2');
  // l3.add('3');
  // print(l3);

  // 第四种定义List的方式
  var l4 = List.filled(5, 0);
  print(l4);
  print(l4.length);
  // l4[5] = 4; 固定了长度后不可以进行超长度去定义元素， 并且不可以去修改数组的长度
  // print(l4);

  // 第一种定义Map的方式
  var person = {"name": "zhangsan", "age": 24};

  print(person);
  print(person['name']);

  // 第二种定义Map的方式
  var person2 = new Map();
  person2['name'] = 'lisi';
  person2['age'] = 25;

  print(person2);
  print(person2['name']);

  const strs = "person";

  print(strs is String);
}
