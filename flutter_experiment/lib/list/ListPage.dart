import 'package:flutter/material.dart';
import 'package:flutter_experiment/resources/AppColors.dart';
import 'package:flutter_experiment/list/children/ListChildPage.dart';

class ListPage extends StatelessWidget {

  Widget _tabBarContainer;

  List<Tab> _listTab = <Tab>[
    new Tab(
      text: "列表",
    ),
    new Tab(
      text: "列表",
    ),
    new Tab(
      text: "动画",
    )
  ];

  ListPage() {
    _tabBarContainer = new TabBar(
      tabs: _listTab,
      indicatorColor: AppColors.color_ffffff,
      isScrollable: true,
      indicatorWeight: 2.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DefaultTabController(
      length: _listTab.length,
      initialIndex: 0,
      child: new Column(
        children: <Widget>[
          new Container(
            constraints: new BoxConstraints.expand(
              height:
                  Theme.of(context).textTheme.display1.fontSize * 1.1 + 10.0,
            ),
            alignment: Alignment.center,
            color: AppColors.color_a0522d,
            child: _tabBarContainer,
          ),
          new Expanded(child: new ListChildPage())
        ],
      ),
    );
  }
}
