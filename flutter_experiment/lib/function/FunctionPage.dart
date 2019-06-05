import 'package:flutter/material.dart';
import 'package:flutter_experiment/function/async/IsolateExp.dart';
import 'package:flutter_experiment/function/http/HttpExp.dart';
import 'package:flutter_experiment/resources/AppColors.dart';
/**
 * 功能页面
 */
class FunctionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _FunctionPageState();
  }
}

class _FunctionPageState extends State<FunctionPage> {
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
      new IsolateExperiment(),
      new HttpPage(),
    ];
    //初始化tab列表
    _listTab = <Tab>[
      new Tab(
        text: "异步",
      ),
      new Tab(
        text: "网络请求",
      ),
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
