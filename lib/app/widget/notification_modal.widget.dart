import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationModal extends StatelessWidget {
  const NotificationModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.cancel_presentation,
                color: Colors.red,
                size: Screen.height(context) * 0.1,
              ),
              SizedBox(
                height: Screen.height(context) * 0.01,
              ),
              Text(
                "Upload Error",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: Screen.height(context) * 0.03,
                ),
              ),
              SizedBox(
                height: Screen.height(context) * 0.02,
              ),
              Text(
                'File size is greater than 2MB.',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: Screen.height(context) * 0.02,
                ),
              ),
              Text(
                'Please upload file below 2MB',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: Screen.height(context) * 0.02,
                ),
              ),
              SizedBox(
                height: Screen.height(context) * 0.02,
              ),
              MaterialButton(
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'Got it',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
