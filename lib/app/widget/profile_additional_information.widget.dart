import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:consumer_app/app/data/controller/controller.dart';
import 'package:consumer_app/app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProfileAdditionalInfo extends GetView<ProfileController> {
  const ProfileAdditionalInfo({Key? key}) : super(key: key);

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
                FontAwesomeIcons.idCard,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Additional Information',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: Screen.height(context) * 0.03,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tax Number',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => InfoField(
                    label: 'TIN',
                    obscureText: false,
                    hint: 'Enter TIN number',
                    isEnabled: controller.isEdit.value,
                    readonly: true,
                    controller: controller.tinNumber,
                    prefixIcon: FontAwesomeIcons.idCard,
                    isRequired: true,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Screen.height(context) * 0.03,
          ),
          const Separator(
            isHorizontal: true,
            dashWidth: 5,
          ),
          SizedBox(
            height: Screen.height(context) * 0.03,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Senior Citizen',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Are you a Senior Citizen?',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Checkbox(
                        value: controller.seniorIdNumber.text.isNotEmpty,
                        onChanged: (value) {},
                        checkColor: Colors.grey,
                        fillColor: MaterialStateProperty.resolveWith(
                            controller.getColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                          (states) =>
                              const BorderSide(width: 1.0, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
                controller.seniorIdNumber.text.isNotEmpty
                    ? Column(
                        children: [
                          Obx(
                            () => InfoField(
                              controller: controller.seniorIdNumber,
                              label: 'Senior Citizen ID Number',
                              obscureText: false,
                              readonly: true,
                              hint: 'Enter senior citizen no.',
                              isEnabled: controller.isEdit.value,
                              initialValue: '',
                              prefixIcon: FontAwesomeIcons.idCard,
                            ),
                          ),
                          SizedBox(
                            height: Screen.height(context) * 0.03,
                          ),
                          Obx(
                            () => InfoFieldUpload(
                              controller: controller.seniorId,
                              label: 'Senior Citizen ID',
                              obscureText: false,
                              hint: 'Upload File',
                              isEnabled: controller.isEdit.value,
                              readonly: true,
                              initialValue: '',
                              callback: () {},
                              prefixIcon: FontAwesomeIcons.cloudArrowUp,
                              suffixWidget: Container(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: IntrinsicWidth(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: const [
                                          Text(
                                            'Maximum file size 2MB',
                                            style: TextStyle(
                                              fontSize: 11,
                                            ),
                                            textAlign: TextAlign.right,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: Screen.height(context) * 0.04,
                                        child: MaterialButton(
                                          color: controller.isEdit.value
                                              ? Theme.of(context).primaryColor
                                              : Colors.grey,
                                          height: Screen.height(context) * 0.04,
                                          minWidth:
                                              Screen.width(context) * 0.35,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          onPressed: () {
                                            if (controller.isEdit.value) {
                                              controller
                                                  .showUploadModal('senior');
                                            }
                                          },
                                          child: const Text(
                                            'Upload File',
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Screen.height(context) * 0.03,
                          ),
                          Obx(
                            () => DateField(
                              controller: controller.seniorIdNumberExpiration,
                              label: 'Senior Citizen ID Expiration Date',
                              hint: 'MM/DD/YYYY',
                              isEnabled: controller.isEdit.value,
                              prefixIcon: Icons.calendar_today,
                              callback: () {
                                if (controller.isEdit.value) {
                                  controller.showDate(context);
                                }
                              },
                            ),
                          )
                        ],
                      )
                    : const SizedBox.shrink(),
                SizedBox(
                  height: Screen.height(context) * 0.03,
                ),
              ],
            ),
          ),
          const Separator(
            isHorizontal: true,
            dashWidth: 5,
          ),
          SizedBox(
            height: Screen.height(context) * 0.03,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Person With Disabilities (PWD)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Are you a PWD?',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: Screen.width(context) * 0.1,
                    // ),
                    Expanded(
                      child: Checkbox(
                        value: controller.pwdIdNumber.text.isNotEmpty,
                        onChanged: (value) {},
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            controller.getColor),
                        side: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Screen.height(context) * 0.03,
                ),
                controller.pwdIdNumber.text.isNotEmpty
                    ? Column(
                        children: [
                          Obx(
                            () => InfoField(
                              isRequired: true,
                              controller: controller.pwdIdNumber,
                              label: 'PWD ID Number',
                              obscureText: false,
                              hint: 'Enter PWD number',
                              isEnabled: controller.isEdit.value,
                              initialValue: '',
                              prefixIcon: FontAwesomeIcons.idCard,
                            ),
                          ),
                          SizedBox(
                            height: Screen.height(context) * 0.03,
                          ),
                          Obx(
                            () => InfoFieldUpload(
                              controller: controller.pwdId,
                              label: 'PWD ID',
                              obscureText: false,
                              hint: 'Upload File',
                              isEnabled: controller.isEdit.value,
                              readonly: true,
                              initialValue: '',
                              prefixIcon: FontAwesomeIcons.cloudArrowUp,
                              callback: () {},
                              suffixWidget: Container(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: IntrinsicWidth(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: const [
                                          Text(
                                            'Maximum file size 2MB',
                                            style: TextStyle(
                                              fontSize: 11,
                                            ),
                                            textAlign: TextAlign.right,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: Screen.height(context) * 0.04,
                                        child: MaterialButton(
                                          color: controller.isEdit.value
                                              ? Theme.of(context).primaryColor
                                              : Colors.grey,
                                          height: Screen.height(context) * 0.04,
                                          minWidth:
                                              Screen.width(context) * 0.35,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          onPressed: () {
                                            controller.showUploadModal('pwd');
                                          },
                                          child: const Text(
                                            'Upload File',
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Screen.height(context) * 0.03,
                          ),
                          Obx(
                            () => DateField(
                              controller: controller.pwdIdNumberExpiration,
                              isEnabled: controller.isEdit.value,
                              label: 'PWD ID Expiration Date',
                              hint: 'MM/DD/YYYY',
                              prefixIcon: Icons.calendar_today,
                              callback: () {
                                controller.showDate(context);
                              },
                            ),
                          )
                        ],
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
