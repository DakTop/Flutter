import 'package:flutter/material.dart';
import 'package:flutter_experiment/resources/AppColors.dart';

/**
 * 通过这总构造函数创建的ListView布局只是适合拥有少量item的布局，因为当加载这样的ListView时候，需要将全部的item创建出来，
 * 并不是显示哪些item就创建哪些item。它的效果和使用SingleChildScrollView+Column的方式没有本质的区别。
 */
class ListChildModeOne extends StatelessWidget {
  List<String> _listText = <String>[
    "item0",
    "item1",
    "item2",
    "item3",
    "item4",
    "item5",
    "item6",
    "item7",
    "item8",
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: AppColors.color_00ffffff,
      child: ListView(
        scrollDirection: Axis.vertical, //滚动方向
        itemExtent: 100.0, //每一个item的高，如果不设置则依赖子控件的高度
        children: _listText.map((String text) {
          return Text(
            text,
            style: TextStyle(
              color: AppColors.color_3b3b3b,
              fontSize: 30.0,
              decoration: TextDecoration.none, //去掉下划线
            ),
          );
        }).toList(),
      ),
    );
  }
}
