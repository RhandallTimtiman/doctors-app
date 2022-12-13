import 'dart:io';

import 'package:consumer_app/app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

class RegistrationAdditionalInfoController extends GetxController {
  TextEditingController tinNumber = TextEditingController();
  TextEditingController seniorId = TextEditingController();
  TextEditingController seniorIdNumber = TextEditingController();
  TextEditingController seniorIdNumberExpiration = TextEditingController();
  TextEditingController pwdId = TextEditingController();
  TextEditingController pwdIdNumber = TextEditingController();
  TextEditingController pwdIdNumberExpiration = TextEditingController();

  final additionalInfoFormKey = GlobalKey<FormState>();

  late CroppedFile seniorIdImage;
  late CroppedFile pwdIdImage;

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
                  Get.find<RegistrationAdditionalInfoController>()
                      .seniorId
                      .text = result.path.split("/").last;
                } else {
                  pwdIdImage = result;
                  Get.find<RegistrationAdditionalInfoController>().pwdId.text =
                      result.path.split("/").last;
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
