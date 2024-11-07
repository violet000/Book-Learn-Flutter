/*
  dart2.13之后的一些新特性
*/
// Dart 2.13 版本（以及其后续版本）引入了一些重要的新特性，提升了语言的功能性、性能以及开发者体验。
// TODO: 1. Null Safety（空安全）
// Dart 2.12 引入了 null safety，而 Dart 2.13 对此进行了进一步优化和增强。Null safety 使得 Dart 编程语言中的变量必须显式声明是否允许为 null，
// 通过这种方式可以在编译时就捕获潜在的空值错误，减少运行时错误的发生。
// 关键点
// 非空类型：默认情况下，所有类型都是非空的，意味着这些变量不能是 null。
// 可空类型：如果一个变量允许为 null，则需要在类型后面加上 ?。
// 晚期初始化：为了支持某些情况下的延迟初始化，可以使用 late 关键字。

// TODO: 延迟初始化 (late 关键字) 的作用和意义
// late 关键字允许我们延迟初始化一个非 null 类型的变量。延迟初始化的核心作用是推迟某个变量的初始化，直到实际使用该变量时，而不是在声明时立即初始化它。
// 通过这种方式，Dart 可以更灵活地处理那些不能在构造时直接赋值的变量，尤其是在类或函数中需要推迟初始化的场景中。
// 示例：
class Person {
  late String name;
  late int age;

  Person();

  // 通过方法初始化
  void initialize(String name, int age) {
    this.name = name;
    this.age = age;
  }
}
// 延迟计算和初始化
class Circle {
  late double radius;
  late double area;

  Circle(double r) {
    radius = r;
  }

  // 延迟计算 area，直到它被访问
  double getArea() {
    area = 3.14 * radius * radius;
    return area;
  }
}
// 使用 late 处理与外部库或环境的依赖
class Database {
  late String connection;

  // 模拟获取数据库连接
  Future<void> initialize() async {
    await Future.delayed(Duration(seconds: 2));
    connection = "Connected to database";
  }
}

// TODO 2. 扩展运算符（...）和集合如果为空时的优化
// Dart 2.13 引入了对集合的更强大支持，特别是当处理集合合并时提供了更多的便捷方法，优化了原有的 ... 运算符。
// 关键点：
// 使用扩展运算符可以方便地将一个集合（如 List 或 Map）的元素合并到另一个集合中。
// 使用扩展运算符时可以处理空集合，避免因空集合操作而产生不必要的错误或异常。

// TODO 3.extension（扩展）
// Dart 2.13 引入了 扩展方法（extension methods），允许你在现有的类上增加新的功能而无需修改原始类。
// 这对于类库的增强和功能扩展非常有用，尤其是在不能修改源代码的情况下。
// 关键点：
// 你可以为现有类型添加新的方法、getter 或 setter。
// 扩展方法非常适用于为第三方库或者平台 SDK 添加特定功能，而无需直接修改库代码。
extension StringUtils on String {
  bool get isValidEmail {
    return RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
  }
}

// TODO 4.typedef 新特性和函数类型增强
// Dart 2.13 引入了 typedef 关键字的增强，使得定义函数类型的方式更加简洁，同时支持更灵活的函数签名。
// 关键点：
// typedef 可以用于定义函数签名类型，帮助提高代码的可读性。
// 允许将 typedef 用于更复杂的函数签名类型，并使得类型推断更为精准。

// 定义一个返回值为 int 的函数类型
typedef IntCalculator = int Function(int a, int b);

int add(int a, int b) => a + b;

// TODO 支持 async 和 await 在 for 和 if 语句中
// 你可以在 for 循环的迭代过程中直接使用 await，使得每次迭代都可以等待异步操作完成。
// 在 if 语句中也可以使用 await 来处理异步值。
// Future 类型
// Future 是 Dart 中用来表示 异步操作 的类，它用于表示将来某个时间点才会完成的任务。Future 可以存储某个异步操作的结果，或者表示异步任务的执行状态（成功、失败、或等待中）。
// 在这个例子中，Future<List<int>> 表示该函数返回的是一个 Future 对象，而该对象最终会包含一个 List<int> 类型的结果。简言之，该函数是异步的，返回一个 整数列表（List<int>），并且该结果将在未来某个时刻可用。
// Future<T> 泛型中的 T 类型表示 Future 会携带的结果类型。这里的 T 是 List<int>，所以当 Future 完成时，它会返回一个 List<int>（即整数列表）。
Future<List<int>> fetchNumbers() async {
  return Future.delayed(Duration(seconds: 2), () => [1, 2, 3]);
}

Future<bool> checkStatus() async {
  return Future.delayed(Duration(seconds: 1), () => true);
}

// TODO 更好的类型推导与泛型支持
// Dart 2.13 继续加强了对类型推导和泛型的支持，允许更加智能的类型推断和自动化的代码生成。
// 关键点：
// 在函数中，Dart 可以推导出更多上下文类型。
// 使得泛型的使用更加灵活。
// var list = <String>['a', 'b', 'c'];  // 类型推导为 List<String>

// TODO 改进的 dart pub 包管理工具
// Dart 2.13 还对 dart pub（包管理工具）进行了很多改进，使得依赖管理、包获取、缓存和发布变得更高效。主要变化包括：
// 更快速的依赖解析。
// 增强的依赖冲突解决机制。
// 改进的缓存机制。

void main() async {
  int x = 0;
  // x = null; // 报错  Error: The value 'null' can't be assigned to a variable of type 'int' because 'int' is not nullable.
  int? y = 0; // y 允许为 null
  y = null;
  // 使用 late 关键字
  late String name;  // 延迟初始化，稍后赋值
  name = 'Dart 2.13';
  print(name);

  var person = Person();
  // 延迟初始化，直到调用 initialize 方法
  person.initialize("Alice", 25);
  print(person.name); // Alice
  print(person.age);  // 25

  var circle = Circle(5);
  print(circle.getArea());  // 78.5

  var db = Database();
  // 在初始化时延迟赋值
  await db.initialize();
  print(db.connection); // 两秒后输出：Connected to database

  List<int> l1 = [1, 2, 3, 4];
  List<int> l2 = [5, 6, 7];
  List<String> s1 = ['a', 'b', 'c'];

  List combine = [...l1, ...l2];
  print(combine); // [1, 2, 3, 4, 5, 6, 7]
  List combine2 = [...l1, ...s1];
  print(combine2); // [1, 2, 3, 4, a, b, c]

  String email1 = "17623178@zjtc.com";
  print(email1.isValidEmail); // true

  IntCalculator calc = add;
  print(calc(2, 3));  // 5

  // 异步 for 循环
  // Future 是一个 单一结果的异步操作，它只会返回一次结果。而 Stream 是一个 多个异步事件的异步序列，可以通过 Stream 获取一个或多个异步结果。
  // 因此，asStream() 提供了一种将 Future 包装成一个 Stream 的方式，使得它可以被 Stream 的消费者处理（例如使用 await for 循环、listen() 等方式）
  await for (var number in fetchNumbers().asStream()) {
    print(number);  // 输出 1, 2, 3
  }

  // 异步 if 判断
  var isReady = await checkStatus();
  if (isReady) {
    print('Ready!');
  }

  var list = <String>['a', 'b', 'c'];  // 类型推导为 List<String>
}
