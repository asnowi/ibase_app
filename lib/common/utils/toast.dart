import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ToastUtils {

  static void show(String? msg){
    if(msg != null && msg.isNotEmpty) {
      Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black87,
          textColor: Colors.white,
          fontSize: 14.0
      );
    }
  }

  static void showBar(String? msg){
    if(msg != null && msg.isNotEmpty) {
      Get.snackbar('', msg);
    }
  }
}