import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:consumer_app/app/data/controller/controller.dart';
import 'package:consumer_app/app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ClinicSection extends StatelessWidget {
  final TextEditingController clinicNameController;
  final TextEditingController clinicAddressController;
  const ClinicSection({
    Key? key,
    required this.clinicNameController,
    required this.clinicAddressController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Clinic Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: Screen.getProportionateScreenHeight(
            context,
            24,
          ),
        ),
        Column(
          children: [
            InfoField(
              isRequired: true,
              controller: clinicNameController,
              label: 'Clinic Name',
              obscureText: false,
              hint: 'Enter clinic name',
              isEnabled: true,
              initialValue: '',
              prefixIcon: FontAwesomeIcons.idCard,
            ),
            SizedBox(
              height: Screen.getProportionateScreenHeight(
                context,
                24,
              ),
            ),
            InfoField(
              isRequired: true,
              label: 'Clinic Address',
              obscureText: false,
              hint: 'Select map address',
              isEnabled: true,
              readonly: true,
              initialValue: 'Test initial value',
              prefixIcon: Icons.map,
              controller: clinicAddressController,
              suffix: Icon(
                FontAwesomeIcons.locationDot,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: Screen.getProportionateScreenHeight(
                context,
                24,
              ),
            ),
            DateField(
              label: 'Clinic Schedule',
              hint: 'MM/DD/YYYY',
              isEnabled: true,
              prefixIcon: Icons.calendar_today,
              callback: () {
                Get.find<RegistrationAdditionalInfoController>()
                    .showDate(context);
              },
            ),
          ],
        ),
      ],
    );
  }
}
