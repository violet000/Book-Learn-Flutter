// 应用程序的主入口文件
// lib/ 存放应用程序的所有 Dart 源代码
import 'package:flutter/material.dart';

// 布局组件
// 1. Container：项目中的多功能布局容器
// Container 是项目开发中常用的基本布局组件。它可以用于定义布局边框、背景颜色、内边距和边距。
// 项目中使用场景：
// 卡片组件：可以用 Container 来包裹其他小组件以形成卡片效果。
// 布局边框：在项目中，使用 Container 可以轻松实现圆角卡片、投影效果和背景图片。

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('自定义组件库', style: TextStyle(color: Colors.white, fontSize: 24))),
      body: Center(
        child: CustomButton(),
      ),
    );
  }
}



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(

        child: Container(
          key: Key("container_card"),
          // color: Colors.blue, // 设置 Container 的背景颜色,不能与 decoration 一起使用，如果 decoration 中指定了 color
          width: 300, // Container容器宽度
          height: 100, // Container容器高度
          alignment: Alignment.center, // 控制Container内部child的对齐方式
          padding: EdgeInsets.all(2), // 内部填充，用于设置 Container 内部内容与边界之间的距离
          decoration: BoxDecoration( // BoxDecoration 是 Flutter 中一个强大且灵活的类，用于为容器（如 Container）提供各种装饰效果
            shape: BoxShape.rectangle, // 设置容器的形状 BoxShape.rectangle（默认）或 BoxShape.circle
            gradient: LinearGradient(
              colors: [Colors.amber, Colors.deepOrange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            ), // 为容器设置渐变效果， LinearGradient：线性渐变 RadialGradient：径向渐变 SweepGradient：扫描渐变
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // 阴影的偏移量
              ),
            ],
            backgroundBlendMode: BlendMode.darken, // 设置背景颜色或图片与渐变效果如何混合
          ), // 用于设置更复杂的背景样式，如渐变、边框、阴影等
          transformAlignment: Alignment.center, // 设置 transform 的对齐方式 AlignmentGeometry
          transform: Matrix4.rotationX(0.6), // 应用于 Container 的变换，比如旋转、缩放、平移等。Matrix4
          constraints: BoxConstraints(minWidth: 100, maxWidth: 300), // 用于设置 Container 的约束，如最小/最大宽度和高度。
          margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 5.0), // 外边距，与其他组件之间的距离设置
          clipBehavior: Clip.antiAlias, // 控制 Container 的剪裁行为 Clip（枚举类型，如 Clip.none、Clip.hardEdge 等）
          foregroundDecoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(4.0),
          ), // 在 Container 上方添加装饰，通常用于覆盖背景装饰
          child: Text('test', style: TextStyle(color: Colors.white)), // Container 内部显示的子组件 Widget
        ),
      ),
    );
  }
}

// 创建一个自定义提交按钮组件
class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('cus-botton'),
      width: 100,
      height: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Text('提交', style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}








