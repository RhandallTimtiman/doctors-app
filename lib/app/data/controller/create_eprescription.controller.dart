import 'package:consumer_app/app/data/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateEprescriptionController extends GetxController {
  TextEditingController patientNameController = TextEditingController();

  RxList medicineList = <ErxMedicine>[].obs;

  addMedicine() {
    medicineList.add(
      ErxMedicine(
        qty: '10',
        medicineName: 'Ketoplast',
        dosage: '100',
        duration: '1 week',
        instruction: 'Before meal',
        direction: 'Once a day',
      ),
    );
  }

  editMedicine(int index) {
    medicineList[index] = ErxMedicine(
      qty: '100',
      medicineName: 'Edited Ketoplast',
      dosage: '100',
      duration: '1 week',
      instruction: 'Before meal',
      direction: 'Once a day',
    );
  }
}
