import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'my_colors.dart';

class CustomToasts {
  static showErrorToast({
    required String errorMessage,
  }) {
    Fluttertoast.showToast(
      msg: errorMessage,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static showSuccessToast({
    required String successMessage,
  }) {
    Fluttertoast.showToast(
      msg: successMessage,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: MyColors.mainRed,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
