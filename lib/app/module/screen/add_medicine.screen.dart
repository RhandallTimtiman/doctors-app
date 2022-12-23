import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:consumer_app/app/data/controller/controller.dart';
import 'package:consumer_app/app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AddMedeicineScreen extends StatefulWidget {
  const AddMedeicineScreen({Key? key}) : super(key: key);

  @override
  State<AddMedeicineScreen> createState() => _AddMedeicineScreenState();
}

class _AddMedeicineScreenState extends State<AddMedeicineScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const ErxAppBar(
        title: 'Add Medicine',
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(
          Screen.getProportionateScreenHeight(
            context,
            16,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Patient Incription',
                      style: textTheme.bodyText1!.copyWith(
                        fontSize: Screen.getProportionateScreenHeight(
                          context,
                          16,
                        ),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: Screen.getProportionateScreenHeight(
                        context,
                        24,
                      ),
                    ),
                    InfoField(
                      label: 'Medicine',
                      obscureText: false,
                      hint: 'Enter medicine',
                      isEnabled: true,
                      prefixIcon: FontAwesomeIcons.pills,
                      controller: Get.find<AddMedicineController>()
                          .medicineNameController,
                      isRequired: true,
                      suffix: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor,
                      ),
                      callback: () {},
                    ),
                    SizedBox(
                      height: Screen.getProportionateScreenHeight(
                        context,
                        16,
                      ),
                    ),
                    InfoField(
                      label: 'Quantity',
                      obscureText: false,
                      hint: 'Enter quantity',
                      isEnabled: true,
                      prefixIcon: Icons.medical_information,
                      controller:
                          Get.find<AddMedicineController>().quantityController,
                      isRequired: true,
                    ),
                    SizedBox(
                      height: Screen.getProportionateScreenHeight(
                        context,
                        16,
                      ),
                    ),
                    InfoField(
                      label: 'Dosage',
                      obscureText: false,
                      hint: 'Enter dosage',
                      isEnabled: true,
                      prefixIcon: Icons.medication,
                      controller:
                          Get.find<AddMedicineController>().dosageController,
                      isRequired: true,
                    ),
                    SizedBox(
                      height: Screen.getProportionateScreenHeight(
                        context,
                        16,
                      ),
                    ),
                    InfoField(
                      label: 'Direction',
                      obscureText: false,
                      hint: 'Enter direction',
                      isEnabled: true,
                      prefixIcon: FontAwesomeIcons.thermometer,
                      controller:
                          Get.find<AddMedicineController>().directionController,
                      isRequired: true,
                    ),
                    SizedBox(
                      height: Screen.getProportionateScreenHeight(
                        context,
                        16,
                      ),
                    ),
                    InfoField(
                      label: 'Duration',
                      obscureText: false,
                      hint: 'Enter duration',
                      isEnabled: true,
                      prefixIcon: FontAwesomeIcons.clock,
                      controller:
                          Get.find<AddMedicineController>().durationController,
                      isRequired: true,
                    ),
                    SizedBox(
                      height: Screen.getProportionateScreenHeight(
                        context,
                        16,
                      ),
                    ),
                    InfoField(
                      label: 'Instruction',
                      obscureText: false,
                      hint: 'Enter instruction',
                      isEnabled: true,
                      prefixIcon: FontAwesomeIcons.notesMedical,
                      controller: Get.find<AddMedicineController>()
                          .instructionController,
                      isRequired: true,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: Screen.getProportionateScreenWidth(
                context,
                Screen.width(context) * 0.8,
              ),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000),
                ),
                color: Theme.of(context).primaryColor,
                minWidth: double.infinity,
                onPressed: () {
                  Get.back(
                    result: 'add',
                  );
                },
                child: Text(
                  'Add Medicine',
                  style: textTheme.headline6!.copyWith(
                    fontSize: Screen.getProportionateScreenHeight(
                      context,
                      16,
                    ),
                    fontWeight: FontWeight.normal,
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
