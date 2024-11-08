class Car {
  String carName;
  double carPrice;
  int carYear;
  Car(this.carName, this.carPrice, this.carYear);

  // 定义一个方法，判断当前车辆是否是品牌车
  bool isBrandCar() {
    if (carName == '宝马' || carName == '奔驰') {
      return true;
    } else {
      return false;
    }
  }

  // 定义一个方法，判断当前车辆是否是价格较高的车
  bool isHighPriceCar() {
    if (carPrice > 500000) {
      return true;
    } else {
      return false;
    }
  }
}
