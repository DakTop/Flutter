import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:flutter_experiment/function/async/bean/IsolateMessage.dart';
import 'package:flutter_experiment/resources/utils/ToastHelper.dart';

/**
 *
 * 参考：https://www.jishuwen.com/d/2MZH
 * https://juejin.im/post/5cdbf2e3f265da035632570e#heading-0
 */
class IsHelper {
  /**
   * 创建新的Isolate，通过ReceivePort通信
   */
  static void createNewIsolate(Function callback) async {
    ReceivePort mainRp = new ReceivePort();
    SendPort mainSp = mainRp.sendPort;
    //创建Isolate只能在静态方法或者顶级函数中（如main函数）
    Isolate isolate = await Isolate.spawn(_doWork, mainSp);
    mainRp.listen((message) {
      IsolateMessage msg = message;
      callback(msg.msg);
      IsolateMessage isolateMessage = new IsolateMessage();
      isolateMessage.sp = mainSp;
      isolateMessage.msg = "向新Isolate发送的消息";
      msg.sp.send(isolateMessage);
      // 可以在适当的时候，调用以下方法杀死创建的 isolate
//      isolate.kill(priority: Isolate.immediate);
    });
  }

  static void _doWork(SendPort mainSp) {
    ReceivePort newRp = new ReceivePort();
    SendPort newSp = newRp.sendPort;
    newRp.listen((message) {
      IsolateMessage im = message;
      print(im.msg);
    });
    IsolateMessage isolateMessage = new IsolateMessage();
    isolateMessage.sp = newSp;
    isolateMessage.msg = "我是来自新Isolate的消息";
    mainSp.send(isolateMessage);
  }

  /**
   * 使用高级api，compute函数来创建新的Isolate
   */
  static void createNewIsolate2(Function callback) async {
    callback(await compute(_doWorks, "通过compute创建"));
  }

  static String _doWorks(String val) {
    return val + ":work finish";
  }

}
