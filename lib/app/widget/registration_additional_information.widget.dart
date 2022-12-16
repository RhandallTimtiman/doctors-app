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
      padding: EdgeInsets.all(
        Screen.getProportionateScreenHeight(
          context,
          16,
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: widget.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Additional Information',
                style: textTheme.headline1!.copyWith(
                  fontSize: Screen.getProportionateScreenHeight(
                    context,
                    16,
                  ),
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: Screen.getProportionateScreenHeight(
                  context,
                  24,
                ),
              ),
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
                height: Screen.getProportionateScreenHeight(
                  context,
                  24,
                ),
              ),
              InfoField(
                controller:
                    Get.find<RegistrationAdditionalInfoController>().tinNumber,
                label: 'TIN',
                obscureText: false,
                hint: 'Enter TIN number',
                isEnabled: true,
                initialValue: '',
                prefixIcon: FontAwesomeIcons.idCard,
                isRequired: true,
              ),
              SizedBox(
                height: Screen.getProportionateScreenHeight(
                  context,
                  24,
                ),
              ),
              const Separator(
                isHorizontal: true,
                dashWidth: 5,
              ),
              SizedBox(
                height: Screen.getProportionateScreenHeight(
                  context,
                  24,
                ),
              ),
              Text(
                'Doctor License Card',
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
              Column(
                children: [
                  InfoField(
                    controller: Get.find<RegistrationAdditionalInfoController>()
                        .seniorIdNumber,
                    label: 'Doctor License ID Number',
                    obscureText: false,
                    hint: 'ID Number',
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
                  InfoFieldUpload(
                    controller: Get.find<RegistrationAdditionalInfoController>()
                        .seniorId,
                    label: 'Doctor License ID',
                    obscureText: false,
                    hint: 'Upload ID',
                    isEnabled: true,
                    readonly: true,
                    initialValue: '',
                    callback: () {},
                    prefixIcon: FontAwesomeIcons.cloudArrowUp,
                    suffixWidget: Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
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
                                color: Theme.of(context).primaryColor,
                                height: Screen.height(context) * 0.04,
                                minWidth: Screen.width(context) * 0.35,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
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
                      context,
                      24,
                    ),
                  ),
                  DateField(
                    label: 'ID Expiration Date',
                    hint: 'MM/DD/YYYY',
                    isEnabled: true,
                    prefixIcon: Icons.calendar_today,
                    callback: showDate,
                  )
                ],
              ),
              SizedBox(
                height: Screen.getProportionateScreenHeight(
                  context,
                  24,
                ),
              ),
              const Separator(
                isHorizontal: true,
                dashWidth: 5,
              ),
              SizedBox(
                height: Screen.getProportionateScreenHeight(
                  context,
                  24,
                ),
              ),
              ClinicSection(
                clinicNameController:
                    Get.find<RegistrationAdditionalInfoController>()
                        .clinicNameController,
                clinicAddressController:
                    Get.find<RegistrationAdditionalInfoController>()
                        .clinicAddressController,
              ),
              SizedBox(
                height: Screen.getProportionateScreenHeight(
                  context,
                  24,
                ),
              ),
              const Separator(
                isHorizontal: true,
                dashWidth: 5,
              ),
              SizedBox(
                height: Screen.getProportionateScreenHeight(
                  context,
                  24,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
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
