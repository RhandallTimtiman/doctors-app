import 'dart:io';

import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:consumer_app/app/data/controller/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

class UploadProfile extends StatefulWidget {
  const UploadProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<UploadProfile> createState() => _UploadProfileState();
}

class _UploadProfileState extends State<UploadProfile> {
  CroppedFile? croppedFile;

  showImageSource() {
    final cas = CupertinoActionSheet(
      cancelButton: CupertinoActionSheetAction(
        child: const Text(
          'Cancel',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        onPressed: () {
          Get.back();
        },
      ),
      actions: [
        CupertinoActionSheetAction(
          child: const Text(
            'Photo Gallery',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          onPressed: () {
            Get.back();
            Get.find<RegistrationController>().getImageFromFiles();
          },
        ),
        CupertinoActionSheetAction(
          child: const Text(
            'Camera',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          onPressed: () {
            Get.back();
            Get.find<RegistrationController>().captureImage();
          },
        ),
      ],
    );

    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => cas,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Upload Image',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.white,
        height: Screen.height(context),
        width: Screen.width(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<RegistrationController>(builder: (_) {
              return Container(
                height: Screen.height(context) * 0.4,
                width: Screen.height(context) * 0.4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  image: _.profileImage != null
                      ? DecorationImage(
                          image: FileImage(
                            File(_.profileImage?.path ?? ''),
                          ),
                        )
                      : null,
                  border: Border.all(
                    color: Colors.black,
                    width: 0.1,
                  ),
                ),
              );
            }),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: Screen.height(context) * 0.4,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Theme.of(context).primaryColor,
                minWidth: double.infinity,
                onPressed: () {
                  showImageSource();
                },
                child: const Text(
                  'Upload Image',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
