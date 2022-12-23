import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:consumer_app/app/data/controller/controller.dart';
import 'package:consumer_app/app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateEprescription extends StatefulWidget {
  const CreateEprescription({Key? key}) : super(key: key);

  @override
  State<CreateEprescription> createState() => _CreateEprescriptionState();
}

class _CreateEprescriptionState extends State<CreateEprescription> {
  String willAddSignature = 'no';
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const ErxAppBar(
        title: 'Create ePrescription',
      ),
      body: Container(
        height: Screen.height(context),
        padding: EdgeInsets.all(
          Screen.getProportionateScreenHeight(
            context,
            16,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Patient Details',
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
                      label: 'Patient Name',
                      obscureText: false,
                      hint: 'Name',
                      isEnabled: true,
                      prefixIcon: Icons.person_outline_rounded,
                      controller: Get.find<CreateEprescriptionController>()
                          .patientNameController,
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
                        24,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.edit,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Screen.getProportionateScreenHeight(
                        context,
                        24,
                      ),
                    ),
                    SizedBox(
                      width: Screen.getProportionateScreenWidth(
                        context,
                        Screen.width(context) * 0.8,
                      ),
                      child: Obx(
                        () => MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          color: Get.find<CreateEprescriptionController>()
                                  .medicineList
                                  .isEmpty
                              ? Colors.grey
                              : Theme.of(context).primaryColor,
                          minWidth: double.infinity,
                          onPressed: () async {
                            var result = await Get.toNamed(
                              '/add-medicine',
                            );
                            if (result != null) {
                              Get.find<CreateEprescriptionController>()
                                  .addMedicine();
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: Screen.getProportionateScreenHeight(
                                  context,
                                  24,
                                ),
                              ),
                              SizedBox(
                                width: Screen.getProportionateScreenWidth(
                                  context,
                                  8,
                                ),
                              ),
                              Text(
                                Get.find<CreateEprescriptionController>()
                                        .medicineList
                                        .isEmpty
                                    ? 'Add Medicine'
                                    : 'Add More Medicine',
                                style: textTheme.headline6!.copyWith(
                                  fontSize: Screen.getProportionateScreenHeight(
                                    context,
                                    16,
                                  ),
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Screen.getProportionateScreenHeight(
                        context,
                        24,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Signature',
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
                            8,
                          ),
                        ),
                        Text(
                          'Attach Signature?',
                          style: textTheme.bodyText1!.copyWith(
                            fontSize: Screen.getProportionateScreenHeight(
                              context,
                              12,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Screen.getProportionateScreenHeight(
                            context,
                            8,
                          ),
                        ),
                        RadioListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            'Yes',
                            style: textTheme.bodyText1!.copyWith(
                              fontSize: Screen.getProportionateScreenHeight(
                                context,
                                12,
                              ),
                            ),
                          ),
                          value: "yes",
                          groupValue: willAddSignature,
                          onChanged: (value) {
                            setState(() {
                              willAddSignature = value.toString();
                            });
                          },
                        ),
                        RadioListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            'No',
                            style: textTheme.bodyText1!.copyWith(
                              fontSize: Screen.getProportionateScreenHeight(
                                context,
                                12,
                              ),
                            ),
                          ),
                          value: "no",
                          groupValue: willAddSignature,
                          onChanged: (value) {
                            setState(() {
                              willAddSignature = value.toString();
                            });
                          },
                        ),
                      ],
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
                onPressed: () {},
                child: Text(
                  'Save',
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
