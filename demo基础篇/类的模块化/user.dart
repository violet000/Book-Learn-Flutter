class User {
  String name;
  int age;
  User(this.name, this.age);

  // 定义一个方法，判断当前用户是否是成年人
  bool isAdult() {
    if (age >= 18) {
      return true;
    } else {
      return false;
    }
  }
}
