import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AuthController extends GetxController {
  TextEditingController idTextController = TextEditingController(); // id controller
  TextEditingController passwdTextController = TextEditingController(); // passwd controller

  @override
  void onInit() {
    super.onInit();
    // _initialData();
  }

}
