import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_experiment/resources/AppColors.dart';

class ToastHelper {
  static void showToast(String text) {
    Fluttertoast.showToast(
      msg: text,
      timeInSecForIos: 1,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.color_a0522d,
      textColor: AppColors.color_3b3b3b,
    );
  }
}
