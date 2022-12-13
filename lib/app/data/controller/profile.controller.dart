import 'dart:io';

import 'package:consumer_app/app/core/constants/countries.dart';
import 'package:consumer_app/app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

class ProfileController extends GetxController {
  List<String> countries = Countries.countryList;

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

  TextEditingController countryController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController barangayController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController mapAddressController = TextEditingController();
  TextEditingController additionalAddressController = TextEditingController();

  TextEditingController tinNumber = TextEditingController();
  TextEditingController seniorId = TextEditingController();
  TextEditingController seniorIdNumber = TextEditingController();
  TextEditingController seniorIdNumberExpiration = TextEditingController();
  TextEditingController pwdId = TextEditingController();
  TextEditingController pwdIdNumber = TextEditingController();
  TextEditingController pwdIdNumberExpiration = TextEditingController();
  late CroppedFile seniorIdImage;
  late CroppedFile pwdIdImage;

  RxBool isEdit = false.obs;

  toggleEdit() {
    isEdit.toggle();
  }

  setupProfile() {
    usernameController.text = 'Juandelacruz2022';
    emailController.text = 'juandelacruz@mail.com';
    firstNameController.text = 'Juan';
    middleNameController.text = 'A';
    lastNameController.text = 'Dela Cruz';
    mobileNumberController.text = '+63 912 345 6789';
    birthdateController.text = '05/22/1987';

    countryController.text = 'Philippines';
    regionController.text = 'NCR';
    stateController.text = 'Metro Manila';
    cityController.text = 'Quezon City';
    barangayController.text = 'Fairview';
    zipCodeController.text = '1500';
    mapAddressController.text =
        '123 Brgy. Fairview, Quezon City, Metro Manila, Philippines';
    additionalAddressController.text = '-';

    tinNumber.text = '440 1213 456';
    seniorIdNumber.text = '080123122';
    seniorId.text = 'senior_ID.jpeg';
    seniorIdNumberExpiration.text = '09/14/2022';
    pwdIdNumber.text = '440 1232 411';
    pwdId.text = 'pwd_id.jpeg';
    pwdIdNumberExpiration.text = '09/14/2022';
  }

  @override
  void onInit() {
    setupProfile();
    super.onInit();
  }

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

  showDate(context) async {
    var newSelectedDate = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        initialDate: DateTime.now().subtract(
          const Duration(days: 3650),
        ),
        firstDate: DateTime.now().subtract(
          const Duration(days: 3650),
        ),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Container(
            child: child,
          );
        });
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.focused,
      MaterialState.selected,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return Colors.white;
  }

  showUploadModal(String type) {
    Get.dialog(
      AlertDialog(
        contentPadding: const EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 24,
          top: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: UploadFileModal(
          callback: (CroppedFile? result) {
            if (result != null) {
              if (validateImage(result)) {
                if (type == 'senior') {
                  seniorIdImage = result;

                  seniorId.text = result.path.split("/").last;
                } else {
                  pwdIdImage = result;
                  pwdId.text = result.path.split("/").last;
                }
              } else {
                openNotification();
              }
            }
            Get.back();
          },
        ),
      ),
    );
  }

  setSeniorImageId(CroppedFile image) {
    seniorIdImage = image;
  }

  setPWDImageId(CroppedFile image) {
    pwdIdImage = image;
  }

  bool validateImage(CroppedFile image) {
    var processedImage = File(image.path);
    var size = processedImage.readAsBytesSync().lengthInBytes;
    final kb = size / 1024;
    final mb = kb / 1024;
    return mb < 2;
  }

  openNotification() {
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: const NotificationModal(),
      ),
    );
  }
}
