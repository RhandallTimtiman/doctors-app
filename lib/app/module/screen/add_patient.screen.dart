import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:consumer_app/app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddPatientScreen extends StatefulWidget {
  const AddPatientScreen({Key? key}) : super(key: key);

  @override
  State<AddPatientScreen> createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
  String isPWD = 'no';
  String isSenior = 'no';
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
    if (newSelectedDate != null) {
      String formattedDate = DateFormat('MMM dd, yyyy').format(newSelectedDate);
      debugPrint(formattedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const ErxAppBar(
        title: 'Add Patient',
      ),
      body: Container(
        height: Screen.height(context),
        width: Screen.width(context),
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
                      label: 'First Name',
                      obscureText: false,
                      hint: 'Enter first name',
                      isEnabled: true,
                      prefixIcon: Icons.person_outline_rounded,
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
                    const InfoField(
                      label: 'M.I',
                      obscureText: false,
                      hint: 'Enter middle initial',
                      isEnabled: true,
                      prefixIcon: Icons.person_outline_rounded,
                      isRequired: true,
                    ),
                    SizedBox(
                      height: Screen.getProportionateScreenHeight(
                        context,
                        16,
                      ),
                    ),
                    const InfoField(
                      label: 'Last Name',
                      obscureText: false,
                      hint: 'Enter last name',
                      isEnabled: true,
                      prefixIcon: Icons.person_outline_rounded,
                      isRequired: true,
                    ),
                    SizedBox(
                      height: Screen.getProportionateScreenHeight(
                        context,
                        16,
                      ),
                    ),
                    const InfoField(
                      label: 'Mobile Number',
                      obscureText: false,
                      hint: 'Enter mobile number',
                      isEnabled: true,
                      prefixIcon: FontAwesomeIcons.mobile,
                      isRequired: true,
                    ),
                    SizedBox(
                      height: Screen.getProportionateScreenHeight(
                        context,
                        16,
                      ),
                    ),
                    DateField(
                      label: 'Birthdate',
                      hint: 'MM/DD/YYYY',
                      isEnabled: true,
                      prefixIcon: Icons.calendar_today,
                      callback: showDate,
                    ),
                    SizedBox(
                      height: Screen.getProportionateScreenHeight(
                        context,
                        16,
                      ),
                    ),
                    const InfoField(
                      label: 'Age',
                      obscureText: false,
                      hint: 'Enter age',
                      isEnabled: true,
                      prefixIcon: Icons.calendar_today,
                      isRequired: true,
                    ),
                    SizedBox(
                      height: Screen.getProportionateScreenHeight(
                        context,
                        16,
                      ),
                    ),
                    InfoField(
                      isRequired: true,
                      label: 'Map Address',
                      obscureText: false,
                      hint: 'Select map address',
                      isEnabled: true,
                      readonly: true,
                      initialValue: 'Test initial value',
                      prefixIcon: Icons.map,
                      suffix: Icon(
                        FontAwesomeIcons.locationDot,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: Screen.getProportionateScreenHeight(
                        context,
                        16,
                      ),
                    ),
                    Text(
                      'Senior',
                      style: textTheme.bodyText1!.copyWith(
                        fontSize: Screen.getProportionateScreenHeight(
                          context,
                          14,
                        ),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: Screen.width(context) * 0.3,
                          child: RadioListTile(
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
                            groupValue: isSenior,
                            onChanged: (value) {
                              setState(() {
                                isSenior = value.toString();
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: Screen.width(context) * 0.3,
                          child: RadioListTile(
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
                            groupValue: isSenior,
                            onChanged: (value) {
                              setState(() {
                                isSenior = value.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Screen.getProportionateScreenHeight(
                        context,
                        16,
                      ),
                    ),
                    Text(
                      'PWD',
                      style: textTheme.bodyText1!.copyWith(
                        fontSize: Screen.getProportionateScreenHeight(
                          context,
                          14,
                        ),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: Screen.width(context) * 0.3,
                          child: RadioListTile(
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
                            groupValue: isPWD,
                            onChanged: (value) {
                              setState(() {
                                isPWD = value.toString();
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: Screen.width(context) * 0.3,
                          child: RadioListTile(
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
                            groupValue: isPWD,
                            onChanged: (value) {
                              setState(() {
                                isPWD = value.toString();
                              });
                            },
                          ),
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
                onPressed: () {
                  Get.back(
                    result: 'add',
                  );
                },
                child: Text(
                  'Add Patient',
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
