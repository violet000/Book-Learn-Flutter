/*
  dart中的库、自定义库、系统库以及第三方库
*/

// Dart 中的库
// Dart 中的库（library）是指一个包含可复用代码的模块。库可以包含类、函数、变量等，提供对外的接口供其他部分使用。Dart 中的库可以分为系统库、第三方库以及自定义库三类。
// 库的定义与使用
// 库通常由 import 语句引入，使用时可以通过 import 语句来加载需要使用的库。
import 'dart:math';  // 导入系统库
import 'my_library.dart';  // 导入自定义库

// Dart 通过 export 语句来允许将某个库的内容暴露给外部。比如：
// my_library.dart
library my_library;

export 'src/my_class.dart';
// export 语句让其他文件可以通过 import 'my_library.dart'; 来使用 my_class.dart 中的内容。

// TODO: 自定义库
// 自定义库是开发者根据项目需要编写的库，它帮助开发者将应用程序中的代码逻辑进行模块化，便于维护和复用。
//
// 自定义库的创建
// 自定义库通常是将代码拆分到多个文件中，然后通过 export 或 import 来组织和共享代码。
// 例如，创建一个自定义库 my_library.dart，它可能包括多个文件和模块。
// my_library.dart
library my_library;

export 'src/first_module.dart';
export 'src/second_module.dart';

// 在 src/first_module.dart 和 src/second_module.dart 中，可以包含不同的功能或类：
// src/first_module.dart
class FirstModule {
  void greet() {
    print("Hello from FirstModule!");
  }
}

// 然后，在应用程序中使用该库：
import 'my_library.dart';

void main() {
  var module = FirstModule();
  module.greet();
}

// TODO: 命名库和库文件结构
// Dart 库可以有一个名称，通常以 library 关键字指定，表示该库的逻辑封装。而 Dart 项目的目录结构也会影响库的组织方式。
// 通常，库的命名使用小写字母，并且模块化到不同的文件夹中。

// TODO: 系统库
// Dart 提供了丰富的系统库，涵盖了从基础数据结构到异步编程、文件 I/O 等各个方面的功能。这些库是 Dart SDK 的一部分，不需要额外安装。

// TODO: 常见的系统库有：
// dart: 包含所有 Dart 程序所必需的核心功能，如 String、int、List、Map 等。
// dart: 提供与异步编程相关的功能，如 Future、Stream 等。
// dart: 用于文件、网络、进程等操作，主要用于命令行应用程序。
// dart: 提供 JSON 编码和解码功能。
// dart: 提供数学计算功能，如常见的数学函数、随机数生成等。
// 例如，使用 dart:math 库生成随机数：
import 'dart:math';

void main() {
  var rand = Random();
  print(rand.nextInt(100));  // 打印一个 0 到 100 之间的随机整数
}

// TODO: 第三方库
// Dart 生态系统中有大量的第三方库，可以通过 pub.dev 获取。
// pub.dev 是 Dart 和 Flutter 的官方包管理网站，提供了大量的可复用库，包括常见的 HTTP 网络请求库、数据库库、图形库等。
// 安装第三方库
// 使用 pub 工具可以方便地安装第三方库。在项目的 pubspec.yaml 文件中，添加所需的依赖项：
dependencies: http: ^0.14.0

// 然后，在命令行中运行 pub get 命令来下载库：
dart pub get

// 安装完成后，可以在 Dart 代码中通过 import 引入该库：
import 'package:http/http.dart' as http;

void fetchData() async {
  var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  print(response.body);
}

// 第三方库示例
// http：用于发起 HTTP 请求。
// provider：Flutter 中常用的状态管理库。
// shared_preferences：用于保存小型本地存储数据。
// json_serializable：用于将 JSON 转换为 Dart 对象的自动化工具。

// TODO: Dart 包与库的区别
// 库（Library）是 Dart 的组织单元，是用来封装代码的最小模块。每个 Dart 文件可以看作一个库。
// 包（Package）是多个库的集合。包可以包含多个 Dart 文件和资源，并且可以通过 pub.dev 发布和分享。

// 在 pubspec.yaml 文件中，依赖项是以包为单位进行管理的，而不是以单个库为单位。例如：
dependencies:
  http: ^0.14.0
  provider: ^6.0.0



