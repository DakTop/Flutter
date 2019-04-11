import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_experiment/main/MainPage.dart';
import 'package:flutter_experiment/resources/AppColors.dart';

void main() {
  runApp(MyApp());
  //设置状态栏颜色
  SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: AppColors.color_000000);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //SafeArea指的是安全区域内容（即除去状态栏高度之外的屏幕空间）
      home: SafeArea(child: new MainPage()),
    );
  }
}
