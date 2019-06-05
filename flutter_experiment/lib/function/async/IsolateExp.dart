import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_experiment/function/async/help/IsolateHelper.dart';
import 'package:flutter_experiment/resources/utils/ToastHelper.dart';

/**
 * Dart中的线程。
 */
class IsolateExperiment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IsolateExperimentState();
  }
}

class IsolateExperimentState extends State<IsolateExperiment> {
  String line = "—————————————————————————————";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("真正的异步任务\n" + line),
          Row(
            children: <Widget>[
              OutlineButton(
                onPressed: press,
                child: Text('创建新Isolate'),
              ),
              OutlineButton(
                onPressed: press2,
                child: Text('简洁的创建新Isolate'),
              ),
            ],
          ),
          Container(
            child: Text("任务调度 ● 将任务添加到MicroTask队列\n" + line),
            margin: EdgeInsets.only(top: 20.0),
          ),
          Row(
            children: <Widget>[
              OutlineButton(
                onPressed: addWorkToMicroTaskOne,
                child: Text('方式一'),
              ),
              OutlineButton(
                onPressed: addWorkToMicroTaskTwo,
                child: Text('方式二'),
              ),
            ],
          ),
          Container(
            child: Text("任务调度 ● 将任务添加到Event队列\n" + line),
            margin: EdgeInsets.only(top: 20.0),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  OutlineButton(
                    onPressed: addWorkToEvent,
                    child: Text('正常添加'),
                  ),
                  OutlineButton(
                    onPressed: addDelayedWorkToEvent,
                    child: Text('添加延时任务'),
                  ),
                  OutlineButton(
                    onPressed: addSyncWorkToEvent,
                    child: Text('添加同步任务'),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  OutlineButton(
                    onPressed: addWorkWithCallbackToEvent,
                    child: Text('带回调的任务'),
                  ),
                  OutlineButton(
                    onPressed: addWorksWithCallbackToEvent,
                    child: Text('当所有任务完成后进行回调'),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  OutlineButton(
                    onPressed: asyncTaskPress,
                    child: Text('async和await关键字'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void press() {
    IsHelper.createNewIsolate((String msg) {
      setState(() {
        ToastHelper.showToast(msg);
      });
    });
  }

  void press2() {
    IsHelper.createNewIsolate2((String msg) {
      setState(() {
        ToastHelper.showToast(msg);
      });
    });
  }

  void addWorkToMicroTaskOne() {
    //使用 scheduleMicrotask 方法添加，将任务添加到MicroTask队列
    ToastHelper.showToast("开始添加");
    scheduleMicrotask(_myTask);
    ToastHelper.showToast("添加结束");
  }

  void addWorkToMicroTaskTwo() {
    // 使用Future对象添加，将任务添加到MicroTask队列
    ToastHelper.showToast("开始添加");
    Future.microtask(_myTask);
    ToastHelper.showToast("添加结束");
  }

  String _myTask() {
    ToastHelper.showToast("任务执行ing...");
    return "执行结果：ok";
  }

  void addWorkToEvent() {
    ToastHelper.showToast("开始添加");
    Future(_myTask);
    ToastHelper.showToast("添加结束");
  }

  /**
   * 表示在延迟时间到了之后将任务加入到Event队列。
   * 需要注意的是，这并不是准确的，万一前面有很耗时的任务，
   * 那么你的延迟任务不一定能准时运行
   */
  void addDelayedWorkToEvent() {
    ToastHelper.showToast("开始添加");
    Future.delayed(Duration(seconds: 6), _myTask);
    ToastHelper.showToast("添加结束");
  }

  /**
   * sync是同步方法，任务会被立即执行
   */
  void addSyncWorkToEvent() {
    ToastHelper.showToast("开始添加");
    Future.sync(_myTask);
    ToastHelper.showToast("添加结束");
  }

  /**
   * 当Future中的任务完成后，我们往往需要一个回调，这个回调立即执行，不会被添加到事件队列。
   * 这个回调通过then来添加
   */
  void addWorkWithCallbackToEvent() {
    ToastHelper.showToast("开始添加");
    Future(_myTask).then((res) {
      //Toast提示执行结果
      ToastHelper.showToast(res);
    });
    ToastHelper.showToast("添加结束");
  }

  /**
   * 等待多个任务全部完成后回调。
   */
  void addWorksWithCallbackToEvent() {
    ToastHelper.showToast("开始添加");
    Future task1 = new Future(() {
      ToastHelper.showToast("任务1...");
      return "任务1：ok，";
    });
    Future task2 = new Future(() {
      ToastHelper.showToast("任务2...");
      return "任务2：ok";
    });
    Future.wait([task1, task2]).then((result) {
      ToastHelper.showToast("任务全部结束：" + result.toString());
    });
    ToastHelper.showToast("添加结束");
  }

  void asyncTaskPress() {
    asyncTask();
    ToastHelper.showToast("async和await关键字");
  }

  /**
   * 参考：https://juejin.im/post/5c4875f86fb9a049ff4e78cf
   */
  void asyncTask() async {
    ToastHelper.showToast("开始添加");
    await ToastHelper.showToast("working...");
    ToastHelper.showToast("添加结束");
  }
}
