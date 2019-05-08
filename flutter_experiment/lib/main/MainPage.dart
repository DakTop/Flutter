import 'package:flutter/material.dart';
import 'package:flutter_experiment/resources/AppColors.dart';
import 'package:flutter_experiment/home/HomePage.dart';
import 'package:flutter_experiment/list/ListPage.dart';
import 'package:flutter_experiment/function/FunctionPage.dart';
class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MainPageRealization();
  }
}

class MainPageRealization extends State<MainPage> {
  Map _bottomMap = {
    "首页": Icon(Icons.home),
    "列表": Icon(Icons.list),
    "功能": Icon(Icons.apps)
  };

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        //icon大小
        iconSize: 23,
        //tab列表
        items: initItems(),
        //默认选中的tab位置
        currentIndex: _index,
        //样式
        type: BottomNavigationBarType.fixed,
        //样式为fixed时，tab选中状态的颜色
        fixedColor: AppColors.color_a0522d,
        onTap: (position) {
          //选中后回调
          setState(() {
            _index = position;
          });
        },
      ),
      body: () {
        switch (_index) {
          case 0:
            return HomePage();
          case 1:
            return ListPage();
          case 2:
            return FunctionPage();
        }
      }(),
    );
  }

  List<BottomNavigationBarItem> initItems() {
    var tabList = <BottomNavigationBarItem>[];
    _bottomMap.forEach((k, v) {
      tabList.add(BottomNavigationBarItem(
          icon: v, title: Text(k), backgroundColor: AppColors.color_a0522d));
    });
    return tabList;
  }
}
