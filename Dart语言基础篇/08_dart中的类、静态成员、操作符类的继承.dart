/*
  深层次的理解dart中的类、静态成员、操作符类的继承

  1、Dart 类的底层实现与机制
    Dart 的类和对象实现基于虚拟机（VM）或 JavaScript 引擎，具体的机制依赖于你是运行在 Dart VM（用于开发和测试）还是在浏览器中通过 Dart2JS 编译成 JavaScript。无论哪种方式，Dart 的类和对象都是通过一些基本的数据结构（如 Class 和 Instance）来组织和管理的。
    对象模型（Object Model）
      Dart 的对象本质上是一个内存中存储的实例，这些实例包含类的元数据（如属性、方法、继承结构等）。类的实例并不直接存储类的方法，而是通过方法的查找表来引用方法（类似于 Java 中的虚方法表机制）。这使得 Dart 的类可以支持动态方法查找，尤其是在继承和多态方面。

    构造函数和初始化
      构造函数不仅仅是初始化类的字段，它还负责通过某些内部机制将构造函数与对象实例关联。类的构造函数在底层会通过某种机制来完成对象的内存分配和初始化。
      例如，Dart 的 命名构造函数 是通过创建一个带有独立方法标识符的函数来实现的，尽管命名构造函数的语法和普通构造函数相似，它在内部是通过额外的符号链接和方法指针来分配的。 
  2、静态成员的底层实现
    静态成员（包括静态字段和静态方法）属于类本身，而不是类的任何实例。底层实现上，静态成员不占据任何实例的内存空间，而是通过类的元数据或映射表进行管理。

    静态字段：
      静态字段存储在类的元数据中，它们在类的所有实例之间共享。这使得静态字段可以在不创建类实例的情况下访问。
    静态方法：  
      静态方法也存储在类的元数据中，它们通过类的方法表进行查找。这使得静态方法可以通过类名直接调用，而不需要创建类的实例。

  3、Dart 中的继承与多态
    继承（Inheritance）：
      继承是 Dart 中实现代码重用的主要机制。子类可以继承父类的属性和方法，并且可以添加自己的属性和方法。
      子类通过 extends 关键字来继承父类，并且可以通过 super 关键字来访问父类的成员。

    多态（Polymorphism）：
      多态是指不同类的对象可以对同一消息作出不同的响应。Dart 支持多态性，这是通过方法重写和方法重载来实现的。
      方法重写：子类可以重写父类的方法，以提供不同的实现。
      方法重载：Dart 支持方法重载，即同一个类中可以有多个具有相同名称但参数不同的方法。

    多态性的底层实现：
      多态性的底层实现依赖于 Dart 的运行时类型信息（Runtime Type Information，RTTI）。Dart 使用类型信息来确定对象的实际类型，从而实现多态性。

    类型信息：
      Dart 中的每个对象都有一个类型信息，它包含了对象的实际类型和继承关系。类型信息在运行时用于确定对象的类型，从而实现多态性。

    方法表：
      每个类都有一个方法表，它存储了类的所有方法。当调用一个方法时，Dart 会通过方法表查找对应的方法。
      方法表是在编译时生成的，它包含了类的所有方法的地址。当调用一个方法时，Dart 会通过方法表查找对应的方法。

    动态类型：
      Dart 是一种动态类型语言，这意味着变量的类型是在运行时确定的，而不是在编译时确定的。这使得 Dart 可以在运行时进行类型检查和方法查找。

    动态类型的底层实现：
      Dart 中的动态类型是通过 Dart VM 或 JavaScript 引擎实现的。在 Dart VM 中，动态类型是通过 Dart 解释器实现的，而在 JavaScript 中，动态类型是通过 JavaScript 引擎实现的。
  4、操作符重载
    操作符重载是指在 Dart 中可以为类定义自己的操作符。Dart 支持操作符重载，这是通过定义特殊的方法来实现的。
    操作符重载的底层实现：
      操作符重载的底层实现依赖于 Dart 的运行时类型信息（Runtime Type Information，RTTI）。Dart 使用类型信息来确定对象的实际类型，从而实现多态性。
      操作符重载的底层实现是通过 Dart 解释器实现的。Dart 解释器会在运行时检查操作符的类型，并调用相应的方法。
*/

// 静态成员、静态方法
// 静态字段：类共享的数据
// 静态字段是类级别的字段，所有该类的实例共享同一个值，而不是每个实例都有自己的副本。
// counter 和 increment 是静态成员，它们被存储在 Counter 类的元数据中，所有的 Counter 类的实例（如果有的话）共享这些静态成员。每次访问 Counter.count 或调用 Counter.increment() 时，Dart 内部会直接引用这些静态字段和方法。

// 示例：计数器类
class Counter {
  static int count = 0; // 静态字段，用于存储计数

  Counter() {
    count++; // 每创建一个实例，静态字段 count 增加
  }

  static void showCount() {
    print("Total instances created: $count");
  }
}

// 示例：比较工具类方法
class MathUtils {
  static int max(int a, int b) {
    return a > b ? a : b;
  }

  static int min(int a, int b) {
    return a < b ? a : b;
  }

  static int sum(int a, int b) {
    return a + b;
  }
}

// 静态字段与实例字段同时存在 类可能同时有静态字段和实例字段。静态字段和实例字段相互独立，静态字段不依赖于类的实例，而实例字段依赖于每个对象。
class Person {
  String name;
  static int population = 0; // 静态字段，用于统计人口数量

  Person(this.name) {
    population++; // 每创建一个实例，静态字段 population 增加
  }

  void sayHello() {
    print("name is $name.");
  }

  static void displayTotal() {
    print("总人数: $population");
  }
}

// 静态成员的常见应用
// 静态成员常用于以下场景：
// 共享数据：多个对象共享的计数器、配置、缓存等。
// 工具类：像 Math、DateTime 这类只包含静态方法的类，通常不需要实例化。
// 工厂方法：有时我们会使用静态方法作为工厂函数，创建对象。

// 工厂方法
// 在某些情况下，你可能需要使用静态方法来控制对象的创建过程。
class DatabaseConnection {
  static DatabaseConnection? _instance; // 单例实例

  // 私有构造函数，防止外部实例化
  DatabaseConnection._internal();

  // 工厂方法，用于获取单例实例
  factory DatabaseConnection() {
    if (_instance == null) {
      _instance = DatabaseConnection._internal();
    }
    return _instance!;
  }

  void connect() {
    print('Connected to the database');
  }
}

// 静态成员的作用范围和访问
// 静态成员和实例成员是分开管理的，你不能在实例方法中直接访问静态字段，除非通过类名来访问。同样，静态方法不能访问实例字段。
class Test {
  int num1 = 100;
  static int num2 = 200;

  // 实例方法能够访问实例成员和静态成员
  void test1() {
    print('$num1 $num2');
  }

  // 静态方法只能访问静态成员
  static void test2() {
    // print(num1); // 报错，不能访问实例成员
    print(num2);
  }
}

// 操作符类的继承
// 操作符类的继承 是指你可以通过继承一个类，并在子类中重写或自定义操作符的行为。也就是说，你可以自定义某些操作符（如 +、-、== 等）如何在类的实例中运作。继承的作用在于，子类不仅继承了父类的属性和方法，还可以继承和重写父类中的操作符
// 操作符重载
// 在 Dart 中，操作符重载是通过定义类中的特殊方法来实现的。这些方法有固定的命名规则，用来重载各种运算符。
// 重载加法运算符
class Point {
  final int x, y;

  Point(this.x, this.y);

  // 重载加法运算符
  // operator + 是 Dart 中加法操作符的重载方法。
  // Point operator +(Point other) 表示这个方法是重载了 + 操作符，它接受一个 Point 类型的参数 other，并返回一个新的 Point 对象。
  // x + other.x 和 y + other.y：这部分代码表示两个 Point 对象的 x 和 y 坐标相加。这里假设 Point 对象有两个成员变量 x 和 y，表示该点的坐标。
  // return Point(x + other.x, y + other.y)：返回一个新的 Point 对象，表示相加后的结果。该新 Point 对象的 x 坐标是两个 Point 对象 x 坐标的和，y 坐标是两个 y 坐标的和。
  Point operator +(Point other) {
    return Point(x + other.x, y + other.y);
  }

  // @override 是一个 Dart 注解（annotation），它的作用是明确告诉 Dart 编译器：你在子类中重写了父类的某个方法。这个注解并不是必须的，但它是一种好的实践，它帮助提高代码的可读性和可维护性。
  // toString() 方法：提供类的字符串表示，通常在调试和日志记录时被使用。你可以通过重写 toString() 来返回你希望的对象字符串表示。
  @override
  String toString() {
    return 'Point($x, $y)';
  }
}

// 操作符的继承
// 操作符的继承 是指你可以通过继承一个类，并在子类中重写或自定义操作符的行为。也就是说，你可以自定义某些操作符（如 +、-、== 等）如何在类的实例中运作。继承的作用在于，子类不仅继承了父类的属性和方法，还可以继承和重写父类中的操作符。
class Shape {
  double area; // 图形的面积

  Shape(this.area);

  // 图形加法运算符
  Shape operator +(Shape other) {
    return Shape(area + other.area);
  }
}

// 子类Circle继承父类Shape
class Circle extends Shape {
  double radius; // 圆的半径

  // 这部分是 构造函数初始化列表，它用于调用父类的构造函数并传递参数。super 关键字表示调用父类的构造函数。
  // super：是 Dart 中用于调用父类构造函数的关键字。在子类的构造函数中，可以使用 super 来调用父类的构造函数并传递参数。
  // 3.14 * radius * radius：这是计算圆的面积的公式。我们假设父类（比如 Shape）的构造函数接受一个表示面积的参数。
  // 在这个例子中，Circle 类可能继承自一个名为 Shape 的父类，Shape 类的构造函数接收一个参数表示面积。super(3.14 * radius * radius) 表示将圆的面积传递给父类的构造函数。
  Circle(this.radius) : super(3.14 * radius * radius); // 调用父类的构造方法

  @override
  Shape operator +(Shape other) {
    return Shape(this.area + other.area);
  }
}

// 父类和子类中的操作符重载继承
// 在 Dart 中，操作符的继承和方法的继承非常类似。子类不仅可以继承父类的方法，还可以继承和重载父类的操作符。如果子类重载了某个操作符，它会覆盖父类中该操作符的实现，但如果没有重载，子类会使用父类的操作符实现。
class XPoint {
  // final 用于声明一个变量，它的值一旦被赋值之后就不能再改变，但赋值的时机是运行时，也就是说，final 变量的值可以在程序运行时根据一些条件来决定，只要赋值之后不再改变即可。
  final int x, y;
  XPoint(this.x, this.y);

  XPoint operator -(XPoint other) {
    return XPoint(this.x - other.x, this.y - other.y);
  }

  @override
  String toString() {
    return '($x, $y)';
  }
}

class YPoint extends XPoint {
  final int x, y;

  YPoint(this.x, this.y) : super(x * 2, y * 2); // 构造函数初始化列表

  @override
  String toString() {
    return 'YPointX: $x, YPointY: $y, SXPointX: ${super.x}, SXPointY: ${super.y}';
  }
}

// 操作符重载与多态
// 操作符重载也支持多态，即可以在不同的子类中重载同一个操作符，实现不同的行为。例如，Shape 类和 Circle 类都可以定义 + 操作符，并且它们会根据各自的实现方式表现不同的行为。
class Shapes {
  double area;
  Shapes(this.area);

  Shapes operator +(Shapes other) {
    return Shapes(this.area + other.area);
  }
}

class Rectangle extends Shapes {
  double width, height;

  Rectangle(this.width, this.height) : super(width * height);

  @override
  Shapes operator +(Shapes other) {
    return Shapes(this.area + other.area);
  }
}

class Circles extends Shapes {
  double radius;

  Circles(this.radius) : super(3.14 * radius * radius);

  @override
  Shapes operator +(Shapes other) {
    return Shapes(this.area + other.area);
  }
}

// 顺便理解一下final和const的区别：运行时常量和编译时常量的区别
// 运行时（Runtime）和编译时（Compile Time）是程序执行过程中的两个不同阶段。理解它们的区别对于编程语言的工作原理非常重要，尤其是在处理变量、常量、代码优化等方面时。

// 1. 编译时（Compile Time）
// 编译时是指程序源代码被编译成机器码或中间代码（如 Dart 的 AOT 或 JIT 编译）并准备执行的过程。编译时发生在程序运行之前，也就是说，编译时的所有操作、检查和优化都是在程序执行之前完成的。

// 编译时发生的事情：
// 语法检查：编译器会检查源代码中的语法是否正确。
// 类型检查：编译器会验证变量和表达式的类型是否符合预期。
// 优化：编译器可能会对代码进行优化，比如常量折叠（将常量表达式在编译时计算并替换成常量值）。
// 生成代码：编译器将源代码转换成机器可执行的代码（或字节码），使其准备好在目标平台上运行。
// 例子：
//  const pi = 3.14;  // pi 在编译时已经确定为常量
// 在这个例子中，pi 的值 3.14 在编译时就已经确定了，并且不会在运行时发生任何变化。

// 编译时常量：
// 在 Dart 中，使用 const 声明的常量必须在编译时已知。这些常量的值在程序运行之前就已经确定了。

// 2. 运行时（Runtime）
// 运行时是指程序在计算机上实际执行时的过程。运行时是程序开始执行之后，代码实际运行并做出响应的时间。在这个阶段，程序会动态地进行各种操作，如输入输出、内存分配、用户交互等。

// 运行时发生的事情：
// 变量赋值：在程序运行时，变量的值可以动态地从外部获取或计算。
// 动态类型检查：在某些语言中，变量类型可以在运行时确定。
// 内存管理：动态分配内存，垃圾回收等。
// 输入/输出操作：读取用户输入，文件操作，网络通信等。
// 例子：
// final currentTime = DateTime.now();  // currentTime 在运行时被赋值
// 在这个例子中，currentTime 的值是在程序运行时由 DateTime.now() 获取的，因此它是一个运行时常量，不能在编译时确定。

// 运行时常量：
// final 变量在程序运行时被赋值，并且赋值之后不能再更改。与 const 不同，final 的值可以是在程序运行时通过某些计算或外部输入来确定的。

// 3. 编译时与运行时的区别：
// 特性	编译时	运行时
// 定义阶段	程序被编译（源代码被转换为机器码或字节码）	程序实际在计算机上执行时
// 时间	程序执行之前	程序执行时
// 代码执行	编译器检查代码、生成可执行代码	程序在计算机上运行并执行逻辑
// 变量赋值	常量在编译时被确定（const）	变量值在程序执行时动态计算（final）
// 类型检查	编译时进行类型检查	运行时动态类型检查（对于动态语言）
// 常量类型	需要编译时可确定的值（const）	运行时不可更改的值（final）
// 4. 编译时和运行时的常见区别：
// 常量的定义：

// const：要求值在编译时确定，不能依赖于运行时的计算。例如，const DateTime.now() 会报错，因为 DateTime.now() 是在运行时获取的值。
// final：可以在运行时确定常量的值，但一旦赋值，值不能改变。例如，final time = DateTime.now(); 是合法的，因为 DateTime.now() 是在程序运行时动态获取的。
// 性能优化：

// 在编译时确定的常量（如 const）可以被编译器进行优化。编译器可能会将常量值直接替换到代码中，减少运行时的计算。
// 在运行时，final 变量的值是动态计算的，因此编译器无法进行类似的优化。
// 5. 示例：编译时和运行时
// 编译时：
// const int maxConnections = 10;  // maxConnections 是编译时常量
// void main() {
//   print(maxConnections);  // 输出 10
// }
// maxConnections 的值 10 在编译时已经确定。
// 运行时：
// final DateTime now = DateTime.now();  // now 是运行时常量
// void main() {
//   print(now);  // 输出当前时间，值是在运行时决定的
// }
// now 的值是在程序执行时通过 DateTime.now() 动态获取的。
// 总结
// 编译时：是指程序在执行之前的时间，编译器会检查代码并生成可执行文件。在编译时确定的值通常是 const，它们在程序运行之前已经确定，并且不能改变。
// 运行时：是程序实际执行时的时间。在运行时，程序会动态计算值，读取外部数据，进行用户交互等。final 变量的值在运行时被赋值，并且赋值后不可修改。

void main() {
  var c1 = Counter();
  var c2 = Counter();
  var c3 = Counter();

  // c1.showCount(); // 错误调用，静态方法属于类本身，而不是实例。你可以在不实例化类的情况下调用静态方法。

  Counter.showCount(); // 输出: Total instances created: 3

  // 静态方法的调用
  print(MathUtils.max(5, 10)); // 输出: 10
  print(MathUtils.max(6, 4)); // 输出: 6
  print(MathUtils.min(4, 7)); // 输出: 4

  var p1 = Person('Alice');
  var p2 = Person('Bob');

  p1.sayHello(); // 输出: my name is Alice.
  p2.sayHello(); // 输出: my name is Bob.

  Person.displayTotal(); // 总人数: 2

  var db1 = DatabaseConnection();
  var db2 = DatabaseConnection();

  db1.connect(); // Connected to the database
  print(db1 == db2); // true 确保只生成了一个实例对象

  var point1 = Point(3, 5);
  var point2 = Point(2, 7);
  var result = point1 + point2; // 调用重载的加法运算符
  print(result); // 输出: Point(5, 12)

  var circle1 = Circle(4);
  var circle2 = Circle(3);
  var resulArea = circle1 + circle2;
  print(resulArea.area); // 输出: 78.5

  var p11 = XPoint(3, 2);
  var p22 = XPoint(1, 2);
  var result1 = p11 - p22;
  print(result1); // 输出: (2, 0)

  var p33 = YPoint(4, 5);
  var p44 = YPoint(6, 7);
  var result2 = p33 - p44;
  print(p33); // YPointX: 4, YPointY: 5, SXPointX: 8, SXPointY: 10
  print(p44); // YPointX: 6, YPointY: 7, SXPointX: 12, SXPointY: 14
  print(result2); // (-2, -2)

  var react1 = Rectangle(3, 4);
  var circle3 = Circles(2);
  var totalArea = react1 + circle3;
  print(totalArea.area); // 输出: 24.560000000000002
}
