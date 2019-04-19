import 'package:flutter/material.dart';
import 'package:flutter_experiment/list/children/ListChildModeOne.dart';
import 'package:flutter_experiment/list/children/ListChildModeTwo.dart';

class ListChildPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        OutlineButton(
          child: Text('ModeOne'),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new ListChildModeOne()));
          },
        ),
        OutlineButton(
          child: Text('ModeTwo'),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new ListChildModeTwo()));
          },
        ),
      ],
    );
  }
}
