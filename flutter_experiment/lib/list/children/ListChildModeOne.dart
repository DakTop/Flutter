import 'package:flutter/material.dart';

class ListChildModeOne extends StatelessWidget {
  List<String> _list = new List<String>.generate(10, (i) {
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
          child: ListView.builder(
            itemCount: _list.length, //列表长度
            itemExtent: 60.0,//每一个item的高，如果不设置则依赖子控件的高度
            itemBuilder: (context, position) {
              return Text('这是第' + _list.elementAt(position),

              );
            }, //返回item子控件
          ),
        ),
      ],
    );
  }
}


