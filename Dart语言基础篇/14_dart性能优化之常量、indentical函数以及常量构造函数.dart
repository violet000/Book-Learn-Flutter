/*
  dart性能优化之常量、indentical函数以及常量构造函数
*/
// 在 Dart 中，性能优化是开发高效、快速应用的重要方面，尤其是在移动设备或资源有限的环境中。
// 常量、identical 函数和常量构造函数是 Dart 中常见的性能优化手段之一。
// 它们通过减少不必要的内存分配、减少对象创建次数、加速比较操作等方式提升性能。
// TODO 常量（const 和 final）
// const 常量
// const 用于定义编译时常量，意味着常量的值在编译时就已知，并且其生命周期通常是应用的整个生命周期。
// const 对象：const 不仅可以用于基本数据类型，还可以用于对象。一个 const 对象是不可变的，并且所有的 const 对象在内存中只有一个实例。
// 编译时常量：在编译时，Dart 会自动将常量值存储并在运行时复用，避免了多次分配内存和重复计算。
const int maxNum = 100;

// TODO 常量构造函数
class Person {
  final String name;
  final int age;
  const Person(this.name, this.age);
}

// TODO identical() 用于检查两个对象是否是同一个实例，它比 == 运算符更高效
// identical() 是 Dart 中的一个内置函数，它用于比较两个对象的 引用是否相同，即它们是否指向内存中的同一块地址。
// 与 == 运算符不同，identical() 并不是用来比较对象的内容，而是用来比较两个对象是否是同一个实例(内存地址)。

void main() {
  var p1 = const Person('lisa', 28);
  var p2 = const Person('lisa', 28);
  print(identical(p1, p2)); // true

  // const 构造函数：
  // const 构造函数使得 Person 类的对象成为编译时常量，这意味着当我们创建 const Person 对象时，Dart 会尽量复用相同的常量对象实例来节省内存。
  // 但是，const 对象的复用是基于构造函数的 所有构造参数 来判断的。也就是说，只有当两个 const 对象的构造参数完全相同
  // Dart 才会将它们视为同一个对象（即引用相同的内存地址）。
  // p1 和 p2 的构造参数不同：
  // p1 是通过 const Person('lisa', 28) 创建的。
  // p2 是通过 const Person('zhangsan', 40) 创建的。
  // 虽然 p1 和 p2 都是 const Person 类型的对象，但它们的构造参数（name 和 age）不同。由于构造参数不同
  // Dart 不会将这两个对象视为相同的常量，而会分别为它们分配不同的内存地址。
  // identical(p1, p2) 的结果是 false：
  // 因为 p1 和 p2 是通过不同的构造参数创建的两个常量对象，Dart 会认为它们是不同的对象，分别在内存中有各自的地址。所以 identical(p1, p2) 返回 false。
  // TODO 同一个实例。只有在所有参数相同的情况下，Dart 才会复用同一个对象。如果构造参数不同，即使是同一个类的对象，Dart 也会认为它们是不同的实例。
  var p3 = const Person('zhangsan', 40);
  print(identical(p1, p3)); // false
}
