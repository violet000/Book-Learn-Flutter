// 在 Dart 中，类可以拆分到不同的文件中，利用 import 来模块化代码。这对于大型项目尤为重要。
import 'car.dart';
import 'user.dart';

void main() {
  // 创建一个Car对象
  Car car = Car('宝马', 600000, 2020);

  // 调用对象的方法
  bool isBrandCar = car.isBrandCar();
  bool isHighPriceCar = car.isHighPriceCar();

  print('这是一辆${car.carName}，价格为${car.carPrice}，年份为${car.carYear}, $isBrandCar, $isHighPriceCar');

  // 创建一个User对象
  User user = User('张三', 20);

  // 调用对象的方法
  bool isAdult = user.isAdult();
  print('${user.name}是成年人吗？$isAdult');
}
