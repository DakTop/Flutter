import 'package:flutter/material.dart';
import 'package:flutter_experiment/resources/AppColors.dart';
import 'package:flutter_experiment/resources/utils/ToastHelper.dart';
import 'dart:isolate';

/**
 * Isolate，
 */
class AsyncPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new AsyncPageState();
  }
}

class AsyncPageState extends State<AsyncPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Container(
        child: Column(
          children: <Widget>[
            OutlineButton(
              onPressed: createIsolate,
              child: Text('创建Isolate'),
            ),
          ],
        ),
        color: AppColors.color_ffffff,
      ),
    );
  }

  SendPort newSendPort;
  Isolate newIsolate;

  /**
   * 创建Isolate
   */
  void createIsolate() async {
    ReceivePort receivePort = ReceivePort();
    newIsolate = await Isolate.spawn(newIsolateCallBack, receivePort.sendPort);
    newSendPort = await receivePort.first;
  }

  static void newIsolateCallBack(SendPort s) {
    ReceivePort newIsolateReceivePort = ReceivePort();
    s.send(newIsolateReceivePort.sendPort);
  }

  Future<String> sendReceive(String msg) async {
    ReceivePort port = ReceivePort();
    newSendPort.send(new IsolateMessage(port.sendPort, "发送到新Isolate的消息"));
  }
}

class IsolateMessage<T> {
  SendPort sendPort;
  T msg;

  IsolateMessage(this.sendPort, this.msg);
}
