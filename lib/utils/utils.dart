import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  static void fieldFocusChange(BuildContext context , FocusNode current , FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static  toastMessage(String message) {
    Fluttertoast.showToast(gravity: ToastGravity.TOP, msg: message);
  }

  static void flushBarErrorMessage(BuildContext context, String? message) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.ease,
          title: "Error",
          message: message,
          borderRadius: BorderRadius.circular(8),
          icon: const Icon(Icons.error),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: const  EdgeInsets.all(15),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
          // flushbarPosition: FlushbarPosition.TOP,
        )..show(context));
  }

  static snackBar(BuildContext context, String? message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message.toString()),
      backgroundColor: Colors.black,
    ));
  }
}
