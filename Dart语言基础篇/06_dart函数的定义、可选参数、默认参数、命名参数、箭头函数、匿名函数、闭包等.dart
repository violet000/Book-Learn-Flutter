/*
  dart中的函数、函数的定义、可选参数、默认参数、命名参数、箭头函数、匿名函数、闭包等

  内置方法/函数：
   print: 打印
   ...

  自定义方法：
   返回类型 方法名称 (参数1, 参数2, 参数3, ...) {

   } 
*/

void main() {
  print('hello world');
  print(getUserName());
  setUserName();
  getUserAddress();
  print(getSum([1, 2, 3], [4, 5, 6]));

  // 命名参数
  greet(); // 使用默认值：Hello, Guest! You are 18 years old.
  greet(name: 'Alice'); // 使用部分传入参数：Hello, Alice! You are 18 years old.
  greet(name: 'Bob', age: 25); // 使用所有传入参数：Hello, Bob! You are 25 years old.

  // 位置参数
  greet2(); // 使用默认值：Hello, Guest! You are 18 years old.
  greet2('Alice'); // 使用部分传入参数：Hello, Alice! You are 18 years old.
  greet2('Bob', 25); // 使用所有传入参数：Hello, Bob! You are 25 years old.

  // 可选命名参数和必需位置参数的混合
  greet3(
      'Alice'); // 使用默认值：Hello, Alice! You are 18 years old and live in Unknown.
  greet3('Bob',
      age:
          25); // 使用部分传入参数：Hello, Bob! You are 25 years old and live in Unknown.
  greet3('Charlie',
      age: 30,
      city:
          'New York'); // 使用所有传入参数：Hello, Charlie! You are 30 years old and live in New York.
  greet4('Alice'); // 输出：Hello, Alice!
  greet4(null); // 输出：Hello, Guest!

  printResult((a, b) => a + b); // 7

  var counter = Counter();
  print(counter()); // 1
  print(counter()); // 2
  print(counter()); // 3
}

// 指定返回类型的函数
String getUserName() {
  return 'zhangsan';
}

// 无返回类型的函数
void setUserName() {
  print('lisi');
}

// 函数的作用域
void getUserAddress() {
  String addr = 'beijing';

  // 定义内部函数方法
  void setAddr() {
    addr = 'shanghai';
    print(addr);
  }

  setAddr();
}

// setAddr(); 在外面无法去访问

// 传入参数
num getSum(List l1, List l2) {
  num sum = 0;
  for (var item in l1) {
    sum += item;
  }

  for (var item in l2) {
    sum += item;
  }

  return sum;
}

// dart中的命名参数
// 命名参数是通过在函数参数列表中使用 {} 来定义的，允许调用时传入参数的名称，而不必按照顺序传递。命名参数可以是可选的，并且可以为其提供默认值。
void greet({String name = 'Guest', int age = 18}) {
  print('Hello, $name! You are $age years old.');
}

// 位置参数
// 位置参数是按照顺序传递的参数。如果你希望参数为可选的，并且不想使用默认值，可以通过 [] 来定义可选的位置参数。这些参数是可选的，可以传递，也可以不传递。
void greet2([String name = 'Guest', int age = 18]) {
  print('Hello, $name! You are $age years old.');
}

// 可选命名参数和必需位置参数的混合
// 也可以混合使用位置参数和命名参数。如果某个参数是必需的，应该放在函数参数列表的前面，而可选的命名参数放在后面。
void greet3(String name, {int age = 18, String city = 'Unknown'}) {
  print('Hello, $name! You are $age years old and live in $city.');
}

// 可选位置参数（可传入空值）
// 如果你希望参数可以传入空值，可以通过将参数类型设为 nullable 类型（使用 ? 后缀）来允许传入 null 值。
void greet4(String? name) {
  if (name != null) {
    print('Hello, $name!');
  } else {
    print('Hello, Guest!');
  }
}

// 箭头函数
// 箭头函数是一种简洁的函数表示方法，它的语法以 => （箭头）开始，适用于只有一个表达式的函数。箭头函数自动返回表达式的值，不需要 return 关键字。
// 特点：
// 适用于只有一个表达式的函数。
// => 后面跟随的是函数的返回值。
// 代码更加简洁。
// 普通函数
int add(int a, int b) {
  return a + b;
}

// 箭头函数
int add2(int a, int b) => a + b;

// 箭头函数的示例（无返回值）：
void printMessage() => print('Hello, Dart!');

// 匿名函数
// 匿名函数是一种没有名称的函数，它可以在需要时定义和使用。匿名函数通常用于需要传递函数作为参数的情况，或者在函数内部定义一个简单的函数。
// 匿名函数是没有名字的函数，通常用作参数传递、回调等。匿名函数可以使用普通的函数语法，也可以使用箭头函数语法。
// 特点：
// 没有函数名。
// 可以作为变量或参数传递。
// 匿名函数通常用于需要函数类型参数的地方，如回调函数。

// 普通匿名函数
var add3 = (int a, int b) {
  return a + b;
};

// 使用匿名函数作为参数
void printResult(Function(int, int) operation) {
  print(operation(3, 4));
}

// 闭包
// 闭包是指一个函数可以访问其外部作用域中的变量，即使该函数在外部作用域之外执行。闭包可以用于创建私有变量和函数，以及实现函数的状态维护。
// 闭包是指一个函数与它的词法作用域（函数内部的变量）绑定在一起。即使外部函数已经返回，闭包仍然可以访问外部函数的局部变量。闭包可以用来封装数据、实现工厂函数等。
// 特点：
// 闭包能够捕获并持有外部函数的变量，即使外部函数已经执行完毕。
// 这种特性使得闭包非常适合用于封装状态、私有数据等。

// count 是一个私有变量，只能通过返回的闭包函数访问和修改
// 通过闭包实现私有变量
Function Counter() {
  int count = 0; // 函数内部的变量

  // 返回一个闭包函数用于访问该变量
  return () {
    count++;
    return count;
  };
}
