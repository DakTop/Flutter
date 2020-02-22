import 'package:flutter/material.dart';
import 'package:flutter_experiment/resources/AppColors.dart';
import 'package:flutter_experiment/resources/utils/ToastHelper.dart';

/**
 * 通过这总构造函数创建的ListView布局只是适合拥有少量item的布局，因为当加载这样的ListView时候，需要将全部的item创建出来，
 * 并不是显示哪些item就创建哪些item。它的效果和使用SingleChildScrollView+Column的方式没有本质的区别。
 *
 * 包括item点击事件。
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
    return Scaffold(
      body: Container(
        color: AppColors.color_ffffff,
        child: ListView.builder(
//          shrinkWrap: true,
//        itemExtent: 100,
          scrollDirection: Axis.vertical,
          //滚动方向
          //每一个item的高，如果不设置则依赖子控件的高度
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                obtainItem("dsf"),
                Expanded(
                  child: Container(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, childAspectRatio: 1),
                      physics: new NeverScrollableScrollPhysics(),
                      primary: false,
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext c, int index) {
                        return obtainGItem("ds");
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget obtainItem(String v) {
    return Container(
      child: MaterialButton(
        child: Text(
          v,
          style: TextStyle(
            color: AppColors.color_3b3b3b,
            fontSize: 30.0,
            decoration: TextDecoration.none, //去掉下划线
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget obtainGItem(String v) {
    return MaterialButton(
      child: Text(
        v,
        style: TextStyle(
          color: AppColors.color_3b3b3b,
          fontSize: 30.0,
          decoration: TextDecoration.none, //去掉下划线
        ),
      ),
      onPressed: () {},
    );
  }
}
