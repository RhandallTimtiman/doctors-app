import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationUserController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();

  final userFormKey = GlobalKey<FormState>();

  RxBool obscurePass = true.obs;
  RxBool obscureConfirmPass = true.obs;

  toggleObscurePass() {
    obscurePass.toggle();
  }

  toggleObscureConfirmPass() {
    obscureConfirmPass.toggle();
  }

  validateNext(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }

  validateConfirmPassword(String confirmPass) {
    return confirmPass != passwordController.text;
  }
}
