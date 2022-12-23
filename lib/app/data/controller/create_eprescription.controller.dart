import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateEprescriptionController extends GetxController {
  TextEditingController patientNameController = TextEditingController();

  RxList medicineList = [].obs;

  addMedicine() {
    medicineList.add('Medicine another');
  }
}
