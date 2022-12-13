import 'dart:developer';
import 'dart:io';

import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:consumer_app/app/data/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ProfileModal extends StatefulWidget {
  final Function callback;
  const ProfileModal({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  State<ProfileModal> createState() => _ProfileModalState();
}

class _ProfileModalState extends State<ProfileModal> {
  final picker = ImagePicker();
  CroppedFile? profileImage;

  Future captureImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 20);
    if (pickedFile != null) {
      CroppedFile? croppedFile = await cropCustomImage(File(pickedFile.path));
      if (croppedFile != null) {
        profileImage = croppedFile;
        Get.find<RegistrationController>().setProfileImage(croppedFile);
      }
    }
  }

  Future getImageFromFiles() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 20);
    if (pickedFile != null) {
      CroppedFile? croppedFile = await cropCustomImage(File(pickedFile.path));
      inspect(croppedFile);
      if (croppedFile != null) {
        // widget.callback(croppedFile);
        setState(() {
          profileImage = croppedFile;
        });
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
          toolbarTitle: 'Profile Photo',
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
      constraints: BoxConstraints(maxHeight: Screen.height(context) * 0.5),
      width: Screen.width(context) * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Profile Photo',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.cancel,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Screen.height(context) * 0.03,
          ),
          Expanded(
            child: Center(child: GetBuilder<RegistrationController>(
              builder: (_) {
                return GestureDetector(
                  onTap: () {
                    if (profileImage == null) {
                      captureImage();
                    }
                  },
                  child: Container(
                    height: Screen.height(context) * 0.2,
                    decoration: BoxDecoration(
                      // color: Colors.amber,
                      shape: BoxShape.circle,
                      image: _.profileImage != null
                          ? DecorationImage(
                              image: FileImage(
                                File(_.profileImage!.path),
                              ),
                            )
                          : null,
                    ),
                  ),
                );
              },
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: MaterialButton(
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.grey,
                  onPressed: () {},
                  child: const Text(
                    'Edit',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {},
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
