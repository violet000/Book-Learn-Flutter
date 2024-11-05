/*
  dart的命名规则：
    1. 变量名必须由数字、字母、下划线和美元符合组成
    2. 注意：标识符开头不能是数字
    3. 标识符不能是保留字和关键字
    4. 变量的名字是区分大小写的
    5. 标识符一定要见名知意


*/

void main() {
  var age = 20;
  var AGE = 30;
  print(age);
  print(AGE);

  // 定义常量   const 常量名 = 值; final 常量名 = 值;
  // const 和 final的区别：final可以开始不赋值，只能赋一次，而final不仅有const的编译时常量的特性，最重要的是它是运行时常量，即在运行时第一次使用前才初始化，而const则是编 译时常量，即在编译时就已经初始化好了。

  const pi = 3.14;
  final pi2 = 3.14159;

  final time = new DateTime.now();

  print(pi);
  print(pi2);
  print(time);
}