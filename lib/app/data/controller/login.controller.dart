import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final userFormKey = GlobalKey<FormState>();

  RxBool obscurePass = true.obs;
  RxBool obscureConfirmPass = true.obs;

  toggleObscurePass() {
    obscurePass.toggle();
  }
}
