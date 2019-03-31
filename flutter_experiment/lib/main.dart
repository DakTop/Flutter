import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Image(
            image: new AssetImage('images/timg.jpeg'),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  verticalDirection: VerticalDirection.down,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "主标题",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      child: Text(
                        "副标题",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    ),
                  ],
                ),
                Text(
                  "关注",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
