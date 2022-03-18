import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';


void WarnToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      webPosition: "center",
      backgroundColor: Colors.red,
      textColor: Colors.white);
}

void ShowToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      webPosition: "center",
      textColor: Colors.white);
}



