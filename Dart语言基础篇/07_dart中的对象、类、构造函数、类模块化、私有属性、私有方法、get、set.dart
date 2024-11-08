/*
  dart中的对象、类、类的创建、构造函数、命名构造函数、类模块化、私有属性、私有方法、get、set

  面向对象编程的概念：封装、继承、多态

  类的继承：extends、super、with、mixin、implements、on、abstract、override、final、const、static、late、final

  封装：封装是对象和类概念的主要特性。封装，把对象的所有组成部分组合在一起，封装定义程序如何引用对象的数据，封装实际上使用方法将数据和基于数据的操作结合起来。

  继承：继承是从已有类得到继承信息创建新类的过程。提供继承信息的类被称为父类（超类、基类）；得到继承信息的类被称为子类（派生类）。继承让变化中的软件系统有了一定的延续性，同时继承也是封装程序中可变因素的重要手段。

  多态：多态是指允许不同子类型的对象对同一消息作出不同的响应。简单的说就是用同样的对象引用调用同样的方法但是做了不同的事情。多态分为编译时多态和运行时多态。

  Dart所有东西都是对象，所有的对象都继承自Object类
  Dart是一门使用类和单继承的面向对象语言，所有的对象都是类的实例，所有的类都是Object的子类。
  一个类通常由属性和方法组成
*/

void main() {
  // 创建对象
  var car = Car('Toyota', 'Corolla', 2022);
  car.displayInfo(); // 输出: 2022 Toyota Corolla
  var user = User('lisi', 40, 'beijing');
  user.getUserInfo(); // username: lisi, age: 40, address: beijing
  var user2 = User.changeName('wangwu');
  user2.getUserInfo(); // username: wangwu, age: 23, address: shanghai

  var city = City('nanjing', 1820);
  city.displayCityInfo(); // nanjing was founded in 1820
  city._getCityName(); // nanjing

  var vag = Food('apple', 43);
  vag.getFoodInfo(); // name: apple, price: 43.0
  vag.price = 52; // 调用set方法
  vag.getFoodInfo(); // name: apple, price: 52.0
}

// 对象与类
// 在 Dart 中，类是创建对象的蓝图。对象是类的实例。你可以通过类定义属性和方法，并通过构造函数来初始化类的实例。
class Car {
  String make;
  String model;
  int year;

  // 构造函数
  Car(this.make, this.model, this.year);

  // 方法
  void displayInfo() {
    print('$year $make $model');
  }
}

// 构造函数
// 构造函数是类用来初始化对象的特殊方法。Dart 提供了默认构造函数和自定义构造函数。
// 默认构造函数 如果没有显式定义构造函数，Dart 会自动生成一个默认构造函数。
class Person {
  String name;
  int age;

  // 默认构造函数
  Person(this.name, this.age);
}

// 命名构造函数
// 除了默认构造函数，Dart 还允许使用命名构造函数来定义多个初始化方法。
class User {
  String username;
  int age;
  String address;

  // 默认构造函数
  User(this.username, this.age, this.address);

  // 命名构造函数
  User.changeName(String name)
      : username = name,
        age = 23,
        address = 'shanghai';

  void getUserInfo() {
    print('username: $username, age: $age, address: $address');
  }
}

// 私有属性与方法
// 不能从类外部访问以 _ 开头的成员（属性和方法）。
// Dart 中的私有属性和方法通过在成员名前加下划线 _ 来实现。私有成员只能在类的内部访问，外部无法直接访问。
class City {
  String _cityName; // 私有变量
  int cityHistoryYear; // 公有变量

  // 构造方法
  City(this._cityName, this.cityHistoryYear);

  // 公有方法
  void displayCityInfo() {
    print('$_cityName was founded in $cityHistoryYear');
  }

  // 私有方法
  void _getCityName() {
    print('$_cityName');
  }
}

// Getter 与 Setter
// Dart 允许通过getter和setter方法来访问对象的属性，这对于封装和数据验证非常有用。
// getter 和 setter 的语法：
// Getter：通过 get 关键字来定义访问属性的方法，语法如 get propertyName => ...;。
// Setter：通过 set 关键字来定义设置属性的方法，语法如 set propertyName(value) { ... }。
class Food {
  String name;
  double _price;

  // 构造函数
  Food(this.name, this._price);

  // get方法
  double get price => _price;

  // set方法
  set price(double p) {
    if (p > 50) {
      _price = p;
    } else {
      _price = 50;
    }
  }

  void getFoodInfo() {
    print('name: $name, price: $_price');
  }
}

// 总结：
// 对象是类的实例，可以通过构造函数来创建。
// 类是对对象的抽象，定义了对象的属性和方法。
// 构造函数是类用于初始化对象的特殊方法。Dart 支持命名构造函数来创建不同的初始化方式。
// 私有成员通过 _ 开头，只有类的内部可以访问。
// Getter 和 Setter用于控制对对象属性的访问和赋值，常用于封装数据和做数据验证。