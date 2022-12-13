import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:consumer_app/app/data/controller/controller.dart';
import 'package:consumer_app/app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RegistrationAdditionalInformation extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const RegistrationAdditionalInformation({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  State<RegistrationAdditionalInformation> createState() =>
      _RegistrationAdditionalInformationState();
}

class _RegistrationAdditionalInformationState
    extends State<RegistrationAdditionalInformation> {
  bool isSeniorCitizen = false;
  bool isPWD = false;

  setSeniorCitizen() {
    setState(() {
      isSeniorCitizen = !isSeniorCitizen;
    });
  }

  setPWD() {
    setState(() {
      isPWD = !isPWD;
    });
  }

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
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.focused,
      MaterialState.selected,
    };
    if (states.any(interactiveStates.contains)) {
      return Theme.of(context).primaryColor;
    }
    return Theme.of(context).primaryColor;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Get.find<RegistrationAdditionalInfoController>().openNotification();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: Screen.width(context),
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        child: Form(
          key: widget.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Additional Information',
                  style: textTheme.headline1!.copyWith(
                    fontSize: Screen.getProportionateScreenHeight(
                      context,
                      16,
                    ),
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: Screen.getProportionateScreenHeight(context, 24),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tax Number',
                      style: textTheme.headline1!.copyWith(
                        fontSize: Screen.getProportionateScreenHeight(
                          context,
                          14,
                        ),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: Screen.getProportionateScreenHeight(context, 24),
                    ),
                    InfoField(
                      controller:
                          Get.find<RegistrationAdditionalInfoController>()
                              .tinNumber,
                      label: 'TIN',
                      obscureText: false,
                      hint: 'Enter TIN number',
                      isEnabled: true,
                      initialValue: '',
                      prefixIcon: FontAwesomeIcons.idCard,
                      isRequired: true,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Screen.getProportionateScreenHeight(context, 24),
              ),
              const Separator(
                isHorizontal: true,
                dashWidth: 5,
              ),
              SizedBox(
                height: Screen.getProportionateScreenHeight(context, 24),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Senior Citizen',
                      style: textTheme.headline1!.copyWith(
                        fontSize: Screen.getProportionateScreenHeight(
                          context,
                          14,
                        ),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Are you a Senior Citizen?',
                            style: textTheme.headline1!.copyWith(
                              fontSize: Screen.getProportionateScreenHeight(
                                context,
                                14,
                              ),
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Checkbox(
                            value: isSeniorCitizen,
                            onChanged: (value) {
                              setSeniorCitizen();
                            },
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    isSeniorCitizen
                        ? Column(
                            children: [
                              InfoField(
                                controller: Get.find<
                                        RegistrationAdditionalInfoController>()
                                    .seniorIdNumber,
                                label: 'Senior Citizen ID Number',
                                obscureText: false,
                                hint: 'Enter senior citizen no.',
                                isEnabled: true,
                                initialValue: '',
                                prefixIcon: FontAwesomeIcons.idCard,
                              ),
                              SizedBox(
                                height: Screen.getProportionateScreenHeight(
                                    context, 24),
                              ),
                              InfoFieldUpload(
                                controller: Get.find<
                                        RegistrationAdditionalInfoController>()
                                    .seniorId,
                                label: 'Senior Citizen ID',
                                obscureText: false,
                                hint: 'Upload File',
                                isEnabled: true,
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
                                            color: const Color.fromRGBO(
                                              73,
                                              130,
                                              61,
                                              1,
                                            ),
                                            height:
                                                Screen.height(context) * 0.04,
                                            minWidth:
                                                Screen.width(context) * 0.35,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            onPressed: () {
                                              Get.find<
                                                      RegistrationAdditionalInfoController>()
                                                  .showUploadModal('senior');
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
                              SizedBox(
                                height: Screen.getProportionateScreenHeight(
                                    context, 24),
                              ),
                              DateField(
                                label: 'Senior Citizen ID Expiration Date',
                                hint: 'MM/DD/YYYY',
                                isEnabled: true,
                                prefixIcon: Icons.calendar_today,
                                callback: showDate,
                              )
                            ],
                          )
                        : const SizedBox.shrink(),
                    SizedBox(
                      height: Screen.getProportionateScreenHeight(context, 24),
                    ),
                  ],
                ),
              ),
              const Separator(
                isHorizontal: true,
                dashWidth: 5,
              ),
              SizedBox(
                height: Screen.getProportionateScreenHeight(context, 24),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
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
                        Expanded(
                          child: Checkbox(
                            value: isPWD,
                            onChanged: (value) {
                              setPWD();
                            },
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    isPWD
                        ? Column(
                            children: [
                              InfoField(
                                isRequired: true,
                                controller: Get.find<
                                        RegistrationAdditionalInfoController>()
                                    .pwdIdNumber,
                                label: 'PWD ID Number',
                                obscureText: false,
                                hint: 'Enter PWD number',
                                isEnabled: true,
                                initialValue: '',
                                prefixIcon: FontAwesomeIcons.idCard,
                              ),
                              SizedBox(
                                height: Screen.getProportionateScreenHeight(
                                    context, 24),
                              ),
                              InfoFieldUpload(
                                controller: Get.find<
                                        RegistrationAdditionalInfoController>()
                                    .pwdId,
                                label: 'PWD ID',
                                obscureText: false,
                                hint: 'Upload File',
                                isEnabled: true,
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
                                            color:
                                                Theme.of(context).primaryColor,
                                            height:
                                                Screen.height(context) * 0.04,
                                            minWidth:
                                                Screen.width(context) * 0.35,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            onPressed: () {
                                              Get.find<
                                                      RegistrationAdditionalInfoController>()
                                                  .showUploadModal('pwd');
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
                              SizedBox(
                                height: Screen.getProportionateScreenHeight(
                                    context, 24),
                              ),
                              DateField(
                                label: 'PWD ID Expiration Date',
                                hint: 'MM/DD/YYYY',
                                isEnabled: true,
                                prefixIcon: Icons.calendar_today,
                                callback: showDate,
                              )
                            ],
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
              SizedBox(
                height: Screen.getProportionateScreenHeight(context, 24),
              ),
              const Separator(
                isHorizontal: true,
                dashWidth: 5,
              ),
              SizedBox(
                height: Screen.getProportionateScreenHeight(context, 24),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.grey,
                        onPressed: () {},
                        child: const Text(
                          'Skip',
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
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
