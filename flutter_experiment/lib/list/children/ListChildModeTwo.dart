import 'package:flutter/material.dart';
import 'package:flutter_experiment/resources/utils/ToastHelper.dart';
import 'package:flutter_experiment/resources/AppColors.dart';

/**
 * 普通的ListView包括：item点击事件、下划线
 */
class ListChildModeTwo extends StatelessWidget {
  List<String> _list = new List<String>.generate(20, (i) {
    return '$i' 'item';
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Image(
          image: new AssetImage('images/list_head.jpg'),
        ),
        Expanded(
          child: Container(
            color: AppColors.color_00ffffff,
            child: ListView.builder(
              scrollDirection: Axis.vertical, //滚动方向
              itemCount: _list.length, //列表长度·
              itemExtent: 60.0, //每一个item的高，如果不设置则依赖子控件的高度
              itemBuilder: (context, position) {
                return OutlineButton(
                  child: Text(_list.elementAt(position)),
                  onPressed: () {//item点击事件
                    ToastHelper.showToast('$position');
                  },
                );
              }, //返回item子控件
            ),
          ),
        ),
      ],
    );
  }
}
