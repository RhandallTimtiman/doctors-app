import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FamilyContactController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> listFamilyContacts = ['Pedro Dela Cruz', 'Juana Dela Cruz'];

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
    debugPrint('open');
  }
}
