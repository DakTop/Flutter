import 'package:flutter/material.dart';
import 'package:flutter_experiment/list/children/CustomListWithHead.dart';
import 'package:flutter_experiment/resources/AppColors.dart';
import 'package:flutter_experiment/list/children/ListChildPage.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ListPageState();
  }
}

class _ListPageState extends State<ListPage> {
  Widget _tabBarContainer;
  TabController _tabController;
  List<Tab> _listTab;
  List<Widget> _listContentView;

  /**
   * 初始化，这个函数在控件的生命周期内调用一次
   */
  @override
  void initState() {
    super.initState();
    //初始化内容页
    _listContentView = <Widget>[
      new ListChildPage(),
      new ListChildPage(),
      new ListChildPage(),
      new ActPage()
    ];
    //初始化tab列表
    _listTab = <Tab>[
      new Tab(
        text: "列表布局",
      ),
      new Tab(
        text: "网格布局",
      ),
      new Tab(
        text: "滚动布局",
      ),
      new Tab(
        text: "混合列表",
      )
    ];
    //初始化TabController
    _tabController = new TabController(
      vsync: new AnimatedListState(),
      length: _listTab.length,
      initialIndex: 0,
    );
    //初始化TabBar
    _tabBarContainer = new TabBar(
      tabs: _listTab,
      indicatorColor: AppColors.color_ffffff,
      isScrollable: true,
      indicatorWeight: 2.0,
      controller: _tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        new Container(
          constraints: new BoxConstraints.expand(
            height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 20.0,
          ),
          alignment: Alignment.bottomCenter,
          color: AppColors.color_a0522d,
          child: _tabBarContainer,
        ),
        new Expanded(
            child: TabBarView(
          children: _listContentView,
          controller: _tabController,
        )),
      ],
    );
  }
}
