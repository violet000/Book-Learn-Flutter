/*
  dart中的泛型、泛型方法、泛型类以及泛型接口
*/

// 在 Dart 中，泛型是一个非常强大的特性，允许我们编写更为灵活和通用的代码。泛型能够在保持类型安全的前提下，允许我们在使用时指定类型，从而避免了类型转换错误。泛型在 Dart 中广泛应用于集合、容器类以及与类型无关的算法中。
// 1. 泛型概述
// 泛型允许我们在编写类、接口、方法时，不指定具体的数据类型，而是使用占位符类型（通常是 T 或其他符号）。这些占位符会在实例化时被具体的类型替换，这样就能在编译时检查类型安全。
// 优点：
// 类型安全：在编译时能检查类型，从而避免运行时的类型错误。
// 代码复用：我们可以编写能够处理多种数据类型的通用代码。
// 可读性和维护性：泛型使得代码更清晰、易于维护。

// 泛型方法
// 泛型方法允许方法在定义时使用泛型类型参数，可以在方法调用时传入具体的类型。这种方法尤其适用于需要处理多种类型的算法，但又不希望强制指定类型。

// 泛型类
// 泛型类允许我们创建一个类，该类可以在实例化时接受不同类型的参数。这使得我们可以创建通用的数据结构，如栈、队列等。

// 泛型接口
// 泛型接口允许我们定义一个接口，该接口可以在实现时接受不同类型的参数。这使得我们可以创建通用的接口，如可迭代的集合。
T myMethod<T>(T arg) {
  return arg;
}

// 其中 T 是类型参数，表示方法可以接收和返回任何类型。
// printElement<T>(T element) 是一个泛型方法，T 是一个占位符类型，它代表方法的参数和返回值的类型。
// 在调用 printElement 时，我们可以传入不同的类型（例如 int 或 String），并且 Dart 会自动推断或接受显式的类型。
T getElement<T>(T element) {
  print('$element');
  return element;
}

// 泛型类
// 泛型类允许类在定义时使用泛型类型参数，创建一个可以接受多种类型的类。类的成员和方法也可以使用该泛型类型参数。
class Person<T> {
  T value;
  Person(this.value);
  void printValue() {
    print('$value');
  }
}

// 在项目中，泛型类非常常见，尤其是在需要处理多种数据类型的情况，比如数据存储、集合、队列、堆栈等。泛型类使得我们可以编写通用的代码，并且保证类型安全，避免强制转换和运行时错误。
// 示例 1: 实现一个通用的容器类
class Box<T> {
  T value;
  Box(this.value);

  T getValue() {
    return this.value;
  }

  void setValue(T value) {
    this.value = value;
  }
}

// 示例 2: 通用的队列实现
class Queue<T> {
  List<T> _list = [];

  // 入队
  void enqueue(T item) {
    _list.add(item);
  }

  // 出队
  T dequeue() {
    if (_list.isEmpty) {
      throw Exception('队列为空');
    }
    return _list.removeAt(0);
  }

  // 查看队列首个元素
  T get firstItem => _list.first;

  // 获取队列长度
  int get queueLength => _list.length;

  // 判断队列是否为空
  bool get _isEmpty => _list.isEmpty;
}

// 示例 3: 通用的缓存类
class Cache<K, V> {
  final Map<K, V> _cache = {};

  // 添加键值对
  void addKey(K key, V value) {
    _cache[key] = value;
  }

  // 删除某个key值
  void removeKey(K key) {
    _cache.removeWhere((k, v) => k == key);
  }

  // 获取某个键的值
  V? getValue(K key) {
    if (!_cache.containsKey(key)) {
      throw Exception('不存在该key!');
    }
    return _cache[key];
  }

  // 判断某个key是否在map中
  bool isKeyContainer(K key) {
    return _cache.containsKey(key);
  }

  @override
  String toString() {
    return '$_cache';
  }
}

// TODO: 泛型接口（或者说泛型类的实现）
// 在 Dart 中，接口本质上就是类，因此泛型接口的实现与泛型类相似。当一个类实现一个泛型接口时，必须指定具体的类型。
abstract class Compare<T> {
  void compare(T a, T b);
}

class IntCompare implements Compare<int> {
  @override
  int compare(int a, int b) {
    if (a > b) {
      return a - b;
    } else {
      return b - a;
    }
  }
}

class StringCompare implements Compare<String> {
  @override
  String compare(String a, String b) {
    if (a.length > b.length) {
      return a;
    } else {
      return b;
    }
  }
}

void main() {
  var result = myMethod<String>("111");
  print(result); // 输出: 111

  getElement<int>(23);
  getElement('test is methods');

  var p1 = Person<String>('join');
  var p2 = Person<int>(50);
  p1.printValue();
  p2.printValue();

  var b1 = Box(10);
  var b2 = Box('demo');
  print(b1.getValue()); // 10
  print(b2.getValue()); // 'demo'

  var q1 = Queue<String>();
  q1.enqueue('a');
  q1.enqueue('b');
  q1.enqueue('c');
  print(q1.queueLength); // 3
  q1.dequeue();
  print(q1.queueLength); // 2
  print(q1.firstItem); // 'b'
  print(q1._isEmpty); // false

  var c1 = Cache();
  c1.addKey("name", "job");
  c1.addKey("age", 20);
  print(c1); // {name: job, age: 20}
  print(c1.getValue("name")); // job
  print(c1.isKeyContainer("name")); // true

  var c2 = IntCompare();
  print(c2.compare(2, 4)); // 2

  var c3 = StringCompare();
  print(c3.compare("d", "chart")); // chart
}
