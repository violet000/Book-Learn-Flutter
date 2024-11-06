/*
  dart的List、Map、Set数据结构详解
*/
void main() {
  /*
    List的常用属性以及方法

    常用属性：
      length：获取List的长度
      reversed: 翻转List
      isEmpty: 判断List是否为空
      isNotEmpty: 判断List是否不为空

    常用方法：
      add: 添加元素
      addAll: 添加多个元素
      indexOf: 获取指定元素的索引
      remove: 删除指定元素
      removeAt: 删除指定位置的元素
      fillRange: 修改
      insert(index, value): 在指定位置插入元素
      insertAll(index, list): 在指定位置插入多个元素(插入一个list)
      toList(): 用于将一个可迭代对象（如 Iterable）转换为一个列表（List）的方法。它常用于将 Set、Map 的键或值等可迭代对象转换为列表。
      join(): List转换为String
      split(): 字符串转化为List
      removeWhere: 删除满足条件的元素
      where: 返回满足条件的数据到一个新的List中去
      any: List中是否存在满足条件的数据
      every: List中每一个是否都满足条件，满足则返回true，不满足则返回false
      clear: 清空List
  */

  List l1 = [1, 2, 3, 4, 5];
  print(l1.length); // 5
  print(l1.reversed); // (5, 4, 3, 2, 1)
  print(l1.isEmpty); // false
  print(l1.isNotEmpty); // true

  l1.add(6);
  print(l1); // [1, 2, 3, 4, 5, 6]

  l1.addAll([7, 8, 9]);
  print(l1); // [1, 2, 3, 4, 5, 6, 7, 8, 9]

  print(l1.indexOf(6)); // 5 返回6的索引下标

  l1.remove(6);
  print(l1); // [1, 2, 3, 4, 5, 7, 8, 9]

  l1.removeAt(0);
  print(l1); // [2, 3, 4, 5, 7, 8, 9] 删除对应的索引值的数据

  l1.fillRange(0, 2, 10);
  print(l1); // [10, 10, 4, 5, 7, 8, 9] 修改指定范围的数据

  l1.insert(0, 1);
  print(l1); // [1, 10, 10, 4, 5, 7, 8, 9] 在指定位置插入元素

  l1.insertAll(1, [2, 2, 2, 2]);
  print(l1); // [1, 2, 2, 2, 2, 10, 10, 4, 5, 7, 8, 9]

  List<int> originalList = [10, 20, 30];
  // 使用 toList() 方法创建一个新的列表
  List<int> newList = originalList.toList();
  print(newList); // 输出: [10, 20, 30]
  print(originalList.join()); // '102030'

  String str = 'hello world';
  List<String> list = str.split(' ');
  print(list); // ['hello', 'world']

  l1.removeWhere((item) => item == 10);
  print(l1); // [1, 2, 2, 2, 2, 4, 5, 7, 8, 9]

  var l2 = l1.where((element) => element > 7);
  print(l2); // (8, 9)

  var l3 = l1.any((element) => element > 7);
  print(l3); // true

  var l4 = l1.every((element) => element > 7);
  print(l4); // false

  l1.clear();
  print(l1); // []

  /*
    Set的常用属性以及方法

    常用属性：
      length：获取Set的长度
      isEmpty: 判断Set是否为空
      isNotEmpty: 判断Set是否不为空

    常用方法：
      add: 添加元素
      addAll: 添加多个元素
      remove: 删除指定元素
      removeWhere: 删除满足条件的元素
      clear: 清空Set
  */

  Set s1 = {1, 2, 3, 4, 5};
  print(s1.length); // 5

  s1.add(6);
  print(s1); // {1, 2, 3, 4, 5, 6}

  s1.add(4);
  print(s1); // {1, 2, 3, 4, 5, 6}

  s1.addAll([7, 8, 9]);
  print(s1); // {1, 2, 3, 4, 5, 6, 7, 8, 9}

  s1.remove(6);
  print(s1); // {1, 2, 3, 4, 5, 7, 8, 9}

  s1.removeWhere((item) => item == 1);
  print(s1); // {2, 3, 4, 5, 7, 8, 9}

  s1.forEach((element) {
    print(element);
  });

  s1.clear();
  print(s1); // {}

  /*
    Map的常用属性以及方法(映射数据类型)

    常用属性：
      length：获取Map的长度
      isEmpty: 判断Map是否为空
      isNotEmpty: 判断Map是否不为空

    常用方法：
      add: 添加元素
      containsKey: 检索key值是否存在
      containsValue: 检索value值是否存在
      addAll: 添加多个元素
      remove: 删除指定元素
      removeWhere: 删除满足条件的元素
      clear: 清空Map
  */

  Map m1 = {'name': '张三', 'age': 18, 'sex': '男'};

  print(m1.length); // 3

  m1['address'] = '北京';
  print(m1); // {name: 张三, age: 18, sex: 男, address: 北京}

  m1.addAll({'height': 1.8, 'weight': 70});
  print(
      m1); // {name: 张三, age: 18, sex: 男, address: 北京, height: 1.8, weight: 70}

  m1.remove('age');
  print(m1); // {name: 张三, sex: 男, address: 北京, height: 1.8, weight: 70}

  m1.removeWhere((key, value) => key == 'name');
  print(m1); // {sex: 男, address: 北京, height: 1.8, weight: 70}

  print(m1.keys.toList()); // [sex, address, height, weight]
  print(m1.values.toList()); // ['男', '北京', 1.8, 70]

  print(m1.containsKey('sex')); // true
  print(m1.containsValue('123')); // false

  m1.clear();
  print(m1); // {}
}
