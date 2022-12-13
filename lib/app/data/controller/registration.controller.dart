import 'dart:io';

import 'package:consumer_app/app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationController extends GetxController {
  CroppedFile? profileImage;
  final picker = ImagePicker();

  showProfileModal() {
    Get.dialog(
      AlertDialog(
        contentPadding: const EdgeInsets.only(
          bottom: 8,
          top: 8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: ProfileModal(
          callback: (CroppedFile? result) {
            if (result != null) {
              profileImage = result;
            }
            Get.back();
          },
        ),
      ),
    );
  }

  bool validateImage(CroppedFile image) {
    var processedImage = File(image.path);
    var size = processedImage.readAsBytesSync().lengthInBytes;
    final kb = size / 1024;
    final mb = kb / 1024;
    return mb < 2;
  }

  setProfileImage(CroppedFile image) {
    profileImage = image;
    update();
  }

  Future captureImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 20);
    if (pickedFile != null) {
      CroppedFile? croppedFile = await cropCustomImage(File(pickedFile.path));
      if (croppedFile != null) {
        setProfileImage(croppedFile);
      }
    }
  }

  Future getImageFromFiles() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 20);
    if (pickedFile != null) {
      CroppedFile? croppedFile = await cropCustomImage(File(pickedFile.path));
      if (croppedFile != null) {
        setProfileImage(croppedFile);
      }
      // Get.back();
    }
  }

  Future<CroppedFile?> cropCustomImage(File imagefile) async {
    return await ImageCropper().cropImage(
      aspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
      sourcePath: imagefile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      compressFormat: ImageCompressFormat.png,
      uiSettings: [
        AndroidUiSettings(
          toolbarColor: Colors.black,
          toolbarTitle: 'Profile Image',
          toolbarWidgetColor: Colors.white,
          hideBottomControls: true,
          lockAspectRatio: true,
          showCropGrid: false,
        ),
        IOSUiSettings(
          rotateButtonsHidden: true,
          rotateClockwiseButtonHidden: true,
        ),
      ],
    );
  }
}
