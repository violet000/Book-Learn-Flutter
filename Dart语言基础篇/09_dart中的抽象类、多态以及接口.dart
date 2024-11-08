/*
  dart中的抽象类、多态以及接口
*/

// 抽象类（Abstract Class）
// 抽象类是一种特殊的类，它不能被实例化，只能被继承。抽象类中可以包含抽象方法（没有方法体的方法），也可以包含非抽象方法。抽象类的主要作用是为其子类提供一个统一的接口，子类必须实现抽象类中的抽象方法。
// 特点：
// 抽象类不能直接实例化。
// 可以包含抽象方法和普通方法（带有实现的方法）。
// 继承抽象类的子类必须实现抽象方法，除非该子类也是抽象类。

// 定义一个抽象类以及抽象方法
abstract class Shape {
  // 抽象方法
  double getArea();

  // 非抽象方法
  void printInfo() {
    print("This is a shape.");
  }
}

// 抽象类的应用
// Animal 是一个抽象类，它有抽象方法 eat()、speak() 和一个普通方法 setAnimalName()
abstract class Animal {
  String name;

  Animal(this.name);

  // 抽象方法
  void eat();

  void speak();

  // 非抽象方法
  String setAnimalName(String name) => this.name = name;
}

// 抽象类子类的实现
// Dog类继承了 Animal 类，并且实现了eat()、speak()方法。
class Dog extends Animal {
  Dog(String name) : super(name);

  @override
  void eat() {
    print("Dog $name is eating.");
  }

  @override
  void speak() {
    print("Dog $name is speaking.");
  }
}

// 多态（Polymorphism）
// 多态是面向对象编程中的一个核心特性，它指的是不同类的对象可以通过相同的接口调用不同的实现。具体来说，方法的多态性是指相同方法调用的不同行为。多态使得我们能够使用统一的接口来操作不同类型的对象，提高了代码的灵活性和可扩展性。
// 多态的两种实现方式：
// 方法重写（Override）：子类可以重新定义父类的方法，以实现不同的行为。
// 接口实现：多个类实现相同的接口，但提供不同的实现。

// 方式一：方法重写
// Apple 和 Orange 类都继承自 Animal 类，并重写了 sound() 方法。
// 当调用 apple.getFoodPrice() 和 orange.getFoodPrice() 时，虽然它们都是 Food 类型的对象，但根据实际对象类型（Apple 或 Orange），会调用不同的实现，这就是多态。
abstract class Food {
  String foodName;
  double foodPrice;
  Food(this.foodName, this.foodPrice);

  void getFoodPrice() {
    print('$foodName的价格是$foodPrice');
  }
}

class Apple extends Food {
  String name;
  double price;

  Apple(this.name, this.price) : super(name, price);

  @override
  void getFoodPrice() {
    print('$foodName的价格是${foodPrice * 2}');
  }
}

class Orange extends Food {
  String name;
  double price;

  Orange(this.name, this.price) : super(name, price);

  @override
  void getFoodPrice() {
    print('$foodName的价格是${foodPrice * 3}');
  }
}

// 方式二：接口实现的多态
// Motorcar 和 Vehicle 类都实现了 Car 接口，并实现了 getCar() 方法。
// 无论 Motorcar 和 Vehicle 是如何创建的，它们都可以通过相同的接口 Car 调用 getCar() 方法，但会产生不同的输出，展示了接口多态。
abstract class Car {
  // 抽象方法
  void getCar();
}

class Motorcar implements Car {
  @override
  void getCar() {
    print('motorcar');
  }
}

class Vehicle implements Car {
  @override
  void getCar() {
    print('vehicle');
  }
}

// TODO: implements 和extends的区别
// 在 Dart 中，implements 和 extends 都用于类的继承，但它们的用途和行为有显著区别。理解这两个关键字的差异对于编写面向对象代码非常重要。
// 1. extends - 用于继承类（单继承）
// extends 用于表示一个类继承另一个类。它表示子类继承父类的所有属性和方法，并且可以选择重写父类的方法。通过 extends，子类可以直接访问父类的字段和方法，并且可以选择性地重写父类的方法。
// 特点：
// 通过 extends 继承父类的实现（包括属性和方法）。
// 子类可以重写父类的方法（方法覆盖）。
// 在 Dart 中，一个类只能继承一个父类（单继承）。
// 示例：
// Dog 类通过 extends 继承了 Animal 类，Dog 类重写了 eat 方法。
// extends 允许子类继承父类的所有实现，并且子类可以选择重写（override）父类的某些方法。
// class Animal {
//   void eat() {
//     print("Animal is eating");
//   }
// }

// class Dog extends Animal {
//   @override
//   void eat() {
//     print("Dog is eating");
//   }
// }

// void main() {
//   var dog = Dog();
//   dog.eat();  // 输出: Dog is eating
// }

// implements - 用于实现接口（多实现）
// implements 用于表示一个类实现一个接口（或实现多个接口）。与 extends 不同，implements 要求类实现接口中声明的所有方法（即便接口没有实现方法）。一个类可以实现多个接口，这使得 Dart 支持多重接口继承。
// 特点：
// 通过 implements，类必须实现接口中的所有方法，接口本身不会提供任何方法实现。
// 一个类可以实现多个接口（多继承）。
// implements 强制要求实现接口中所有的方法，而不是继承方法的实现。
// abstract class Animal {
//   void eat();
// }

// abstract class Flyable {
//   void fly();
// }

// class Bird implements Animal, Flyable {
//   @override
//   void eat() {
//     print("Bird is eating");
//   }

//   @override
//   void fly() {
//     print("Bird is flying");
//   }
// }

// void main() {
//   var bird = Bird();
//   bird.eat();  // 输出: Bird is eating
//   bird.fly();  // 输出: Bird is flying
// }
//TODO: extends 与 implements 的区别总结
// 特性	extends	implements
// 用途	用于继承一个类，并且可以访问父类的实现（属性和方法）	用于实现一个或多个接口（仅提供方法签名，没有实现）
// 方法实现	子类可以继承并重写父类的方法	类必须实现接口中所有方法（没有方法实现）
// 继承类型	单继承，一个类只能继承一个父类	多实现，一个类可以实现多个接口
// 字段继承	子类继承父类的字段（属性）	不继承接口中的任何字段，只实现方法
// 继承的行为	子类继承父类的实现，并可以选择重写	类完全按照接口要求实现方法
// 关键字使用	extends	implements

//TODO: 抽象类、接口与多态的关系
// 抽象类和接口都是为了定义一种规范（或契约），但抽象类可以提供部分实现，而接口不可以。
// 多态是通过方法重写或接口实现来实现的，允许使用统一的接口或基类方法来处理不同类型的对象，展示不同的行为。
// 对比抽象类和接口：
// 特性	抽象类	接口
// 实现	允许实现部分方法（带有实现）	只定义方法签名，不提供实现
// 继承	可以继承一个类（单继承）	一个类可以实现多个接口（多实现）
// 构造函数	可以有构造函数	无构造函数
// 用途	提供部分实现，作为基类供继承	定义协议或契约，强制实现接口的方法
// 结论：
// 抽象类：可以提供部分实现，并为子类提供模板。子类可以继承抽象类，并实现其抽象方法。
// 接口：只提供方法签名，要求实现该接口的类必须实现接口中声明的所有方法。一个类可以实现多个接口。
// 多态：允许不同类的对象通过统一的接口调用不同的行为，从而增强程序的灵活性。

void main() {
  var dog = Dog('bob');
  dog.eat();
  dog.setAnimalName('bilina');
  dog.eat();

  var apple = Apple('hongfushi', 34);
  apple.getFoodPrice(); // hongfushi的价格是68.0

  var orange = Orange('jicheng', 12);
  orange.getFoodPrice(); // jicheng的价格是36.0

  var motor = Motorcar();
  var vehicle = Vehicle();
  motor.getCar(); // motorcar
  vehicle.getCar(); // vehicle
}
