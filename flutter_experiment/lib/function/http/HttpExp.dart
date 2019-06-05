import 'package:flutter/material.dart';

/**
 * 网络请求
 */
class HttpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HttpPageState();
  }
}

class HttpPageState extends State<HttpPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          OutlineButton(
            onPressed: httpPress,
            child: Text("网络请求"),
          ),
        ],
      ),
    );
  }

  void httpPress() {}
}
