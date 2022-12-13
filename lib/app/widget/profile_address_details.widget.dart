import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:consumer_app/app/data/controller/controller.dart';
import 'package:consumer_app/app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProfileAddressDetails extends StatefulWidget {
  const ProfileAddressDetails({Key? key}) : super(key: key);

  @override
  State<ProfileAddressDetails> createState() => _ProfileAddressDetailsState();
}

class _ProfileAddressDetailsState extends State<ProfileAddressDetails> {
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
                Icons.house,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Address Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => InfoField(
              controller: Get.find<ProfileController>().countryController,
              isRequired: true,
              label: 'Country',
              obscureText: false,
              readonly: true,
              isEnabled: Get.find<ProfileController>().isEdit.value,
              initialValue: '',
              prefixIcon: Icons.public,
              suffix: Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).primaryColor,
              ),
              callback: Get.find<ProfileController>().showModalCountries,
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => InfoField(
              controller: Get.find<ProfileController>().regionController,
              isRequired: true,
              label: 'Region',
              obscureText: false,
              readonly: true,
              isEnabled: Get.find<ProfileController>().isEdit.value,
              initialValue: '',
              prefixIcon: Icons.public,
              suffix: Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).primaryColor,
              ),
              callback: Get.find<ProfileController>().showModalCountries,
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => InfoField(
              controller: Get.find<ProfileController>().stateController,
              isRequired: true,
              label: 'State / Province',
              obscureText: false,
              readonly: true,
              isEnabled: Get.find<ProfileController>().isEdit.value,
              initialValue: '',
              prefixIcon: Icons.public,
              suffix: Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).primaryColor,
              ),
              callback: Get.find<ProfileController>().showModalCountries,
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => InfoField(
              controller: Get.find<ProfileController>().cityController,
              isRequired: true,
              label: 'City',
              obscureText: false,
              readonly: true,
              isEnabled: Get.find<ProfileController>().isEdit.value,
              initialValue: '',
              prefixIcon: Icons.public,
              suffix: Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).primaryColor,
              ),
              callback: Get.find<ProfileController>().showModalCountries,
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => InfoField(
              controller: Get.find<ProfileController>().barangayController,
              isRequired: true,
              label: 'Barangay',
              obscureText: false,
              readonly: true,
              isEnabled: Get.find<ProfileController>().isEdit.value,
              initialValue: '',
              prefixIcon: Icons.public,
              suffix: Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).primaryColor,
              ),
              callback: Get.find<ProfileController>().showModalCountries,
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => InfoField(
              controller: Get.find<ProfileController>().zipCodeController,
              isRequired: true,
              label: 'Zip Code',
              obscureText: false,
              readonly: true,
              isEnabled: Get.find<ProfileController>().isEdit.value,
              initialValue: '',
              prefixIcon: Icons.public,
              suffix: Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).primaryColor,
              ),
              callback: Get.find<ProfileController>().showModalCountries,
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => InfoField(
              isRequired: true,
              label: 'Map Address',
              obscureText: false,
              isEnabled: Get.find<ProfileController>().isEdit.value,
              readonly: true,
              prefixIcon: Icons.map,
              controller: Get.find<ProfileController>().mapAddressController,
              suffix: Icon(
                FontAwesomeIcons.locationDot,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => InfoField(
              label: 'Additional Address Information (ie.bldg, etc)',
              obscureText: false,
              isEnabled: Get.find<ProfileController>().isEdit.value,
              readonly: true,
              prefixIcon: null,
              controller:
                  Get.find<ProfileController>().additionalAddressController,
              suffix: Icon(
                FontAwesomeIcons.locationDot,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
