import 'package:flutter/material.dart';
import 'package:flutter_experiment/resources/AppColors.dart';
import 'package:flutter_experiment/list/children/ListChildPage.dart';

class ListPage extends StatelessWidget {
  static List<String> listTab = <String>[
    "列表",
    "列表",
    "动画",
  ];

  Widget tabBarContainer = new TabBar(
    tabs: listTab.map((String tabStr) {
      return new Tab(
        text: tabStr,
      );
    }).toList(),
    indicatorColor: AppColors.color_a0522d,
    isScrollable: true,
    indicatorWeight: 2.0,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: new Column(
        children: <Widget>[
          new Container(
            constraints: new BoxConstraints.expand(
              height:
                  Theme.of(context).textTheme.display1.fontSize * 1.1 + 50.0,
            ),
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            color: AppColors.color_a0522d,
            child: tabBarContainer,
          ),
          new Expanded(child: new ListChildPage())
        ],
      ),
    );
  }
}
