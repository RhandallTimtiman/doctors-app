import 'package:consumer_app/app/core/constants/countries.dart';
import 'package:consumer_app/app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationAddressrController extends GetxController {
  List<String> countries = Countries.countryList;

  final addressFormKey = GlobalKey<FormState>();

  TextEditingController countryController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController barangayController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController mapAddressController = TextEditingController();
  TextEditingController additionalAddressController = TextEditingController();

  showModalCountries() {
    Get.dialog(
      AlertDialog(
        title: const Text(
          'Select Country',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        contentPadding: const EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 24,
          top: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: AddressListModal(
          list: countries,
          callback: (value) {
            countryController.text = value;
          },
        ),
      ),
    );
  }

  validateNext(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }
}
