/*
  dart中一个类实现多个接口以及dart中的Mixins
  在 Dart 中，一个类可以 实现多个接口，并且可以使用 mixins 来组合多个类的功能。这两个特性为 Dart 提供了灵活的方式来构建和扩展类。下面我们详细讲解 实现多个接口 和 mixins 的使用。
*/

// 类实现多个接口
// 在 Dart 中，类可以通过 implements 关键字实现多个接口。这与许多其他语言的接口继承机制类似，但是 Dart 的接口不需要显式使用 interface 关键字，任何类都可以作为接口。

// 关键点：
// 实现多个接口：通过逗号分隔的方式，一个类可以实现多个接口。
// 接口的要求：类实现的每个接口中的所有方法必须被该类实现，否则会报错。
abstract class Animal {
  void eat();
}

abstract class Flyable {
  void fly();
}

abstract class Swimmable {
  void swim();
}

// 使用implements实现多个接口时，需要注意的是，实现的接口中的方法必须全部实现，否则会报错。
class Bird implements Animal, Flyable, Swimmable {
  @override
  void eat() {
    print("Bird is eating");
  }

  @override
  void fly() {
    print("Bird is flying");
  }

  @override
  void swim() {
    print("Bird is swimming");
  }
}

// Dart 中的 Mixins（混入）
// Mixins（混入）是 Dart 中的一种复用代码的机制，它允许你将多个类的功能“混入”到一个类中，而不需要继承父类。与传统的单继承不同，mixins 让你能够在类中包含来自多个类的行为。
// 关键点：
// Mixins：是一种允许将多个类的功能混合到一个类中的方式。它不同于接口和传统继承。
// 混入类：用 with 关键字来指定，表示将一个或多个类的行为混入到当前类。
// Mixins 可以继承其他 mixin，这使得 mixins 具备更强的灵活性和复用性。
// 使用 with 关键字实现混入
mixin Fly {
  void flyable() {
    print('i can fly');
  }
}

mixin Swim {
  void swimable() {
    print('i can swim');
  }
}

class Person {
  void walk() {
    print('i can walk');
  }
}

class Student extends Person with Fly, Swim {
  void study() {
    print('i can study');
  }
}

void main() {
  var s1 = Student();
  s1.walk(); // i can walk
  s1.flyable(); // i can fly
  s1.swimable(); // i can swim
  s1.study(); // i can study
}
