import 'dart:developer';

import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:consumer_app/app/data/controller/controller.dart';
import 'package:consumer_app/app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileUserDetails extends StatefulWidget {
  const ProfileUserDetails({Key? key}) : super(key: key);

  @override
  State<ProfileUserDetails> createState() => _ProfileUserDetailsState();
}

class _ProfileUserDetailsState extends State<ProfileUserDetails> {
  showDate() async {
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
    inspect(newSelectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Screen.width(context),
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.person_outline_rounded,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Obx(
            () {
              return InfoField(
                label: 'Username',
                obscureText: false,
                isEnabled: Get.find<ProfileController>().isEdit.value,
                prefixIcon: Icons.person_outline_rounded,
                controller: Get.find<ProfileController>().usernameController,
              );
            },
          ),
          const SizedBox(height: 10),
          Obx(
            () => InfoField(
              label: 'Email Address',
              obscureText: false,
              callback: () {},
              isEnabled: Get.find<ProfileController>().isEdit.value,
              prefixIcon: Icons.email_rounded,
              controller: Get.find<ProfileController>().emailController,
              isRequired: true,
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => InfoField(
              label: 'First Name',
              obscureText: false,
              callback: () {},
              isEnabled: Get.find<ProfileController>().isEdit.value,
              prefixIcon: Icons.person_outline_rounded,
              controller: Get.find<ProfileController>().firstNameController,
              isRequired: true,
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => InfoField(
              label: 'M.I',
              obscureText: false,
              callback: () {},
              isEnabled: Get.find<ProfileController>().isEdit.value,
              prefixIcon: Icons.person_outline_rounded,
              controller: Get.find<ProfileController>().middleNameController,
              isRequired: true,
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => InfoField(
              label: 'Last Name',
              obscureText: false,
              callback: () {},
              isEnabled: Get.find<ProfileController>().isEdit.value,
              prefixIcon: Icons.person_outline_rounded,
              controller: Get.find<ProfileController>().lastNameController,
              isRequired: true,
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => InfoField(
              label: 'Mobile Number',
              obscureText: false,
              callback: () {},
              isEnabled: Get.find<ProfileController>().isEdit.value,
              prefixIcon: Icons.numbers,
              controller: Get.find<ProfileController>().mobileNumberController,
              isRequired: true,
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => DateField(
              label: 'Birthdate',
              hint: 'MM/DD/YYYY',
              isEnabled: Get.find<ProfileController>().isEdit.value,
              prefixIcon: Icons.calendar_today,
              callback: showDate,
              controller: Get.find<ProfileController>().birthdateController,
            ),
          ),
        ],
      ),
    );
  }
}
