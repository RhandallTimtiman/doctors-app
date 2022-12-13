import 'dart:io';

import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:consumer_app/app/data/controller/controller.dart';
import 'package:consumer_app/app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final PageController pageController = PageController(initialPage: 0);
  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: Screen.height(context),
        child: Column(
          children: [
            SizedBox(
              height: Screen.height(context) * 0.3,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/ellipse_bg.png',
                    width: double.infinity,
                    fit: BoxFit.fill,
                    height: Screen.height(context) * .25,
                  ),
                  Positioned(
                    top: 40,
                    child: SizedBox(
                      width: Screen.width(context),
                      child: Column(
                        children: [
                          Text(
                            'Getting Started',
                            style: textTheme.headline5!.copyWith(
                              fontSize: Screen.getProportionateScreenHeight(
                                context,
                                28,
                              ),
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Create an account for exciting features',
                            style: textTheme.headline1!.copyWith(
                              fontSize: Screen.getProportionateScreenHeight(
                                context,
                                16,
                              ),
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            height: Screen.getProportionateScreenHeight(
                                context, 12),
                          ),
                          SizedBox(
                            width: Screen.width(context) * 0.7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currentPageIndex = 0;
                                    });
                                    pageController.animateToPage(
                                      0,
                                      duration:
                                          const Duration(milliseconds: 100),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 0.5,
                                        color: Colors.white,
                                      ),
                                      color: currentPageIndex == 0
                                          ? Colors.grey
                                          : null,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      '1',
                                      style: textTheme.headline1!.copyWith(
                                        fontSize:
                                            Screen.getProportionateScreenHeight(
                                          context,
                                          16,
                                        ),
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: Colors.white,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currentPageIndex = 1;
                                    });
                                    pageController.animateToPage(
                                      1,
                                      duration:
                                          const Duration(milliseconds: 100),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.white,
                                      ),
                                      color: currentPageIndex == 1
                                          ? Colors.grey
                                          : null,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      '2',
                                      style: textTheme.headline1!.copyWith(
                                        fontSize:
                                            Screen.getProportionateScreenHeight(
                                          context,
                                          16,
                                        ),
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: Colors.white,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currentPageIndex = 2;
                                    });
                                    pageController.animateToPage(
                                      2,
                                      duration:
                                          const Duration(milliseconds: 100),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.white,
                                      ),
                                      color: currentPageIndex == 2
                                          ? Colors.grey
                                          : null,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      '3',
                                      style: textTheme.headline1!.copyWith(
                                        fontSize:
                                            Screen.getProportionateScreenHeight(
                                          context,
                                          16,
                                        ),
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
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
                  Positioned(
                    top: 145,
                    child: SizedBox(
                      width: Screen.width(context),
                      child: Center(
                        child: Material(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10000),
                          ),
                          elevation: 4,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(
                                const UploadProfile(),
                              );
                            },
                            child: GetBuilder<RegistrationController>(
                              builder: (_) {
                                if (_.profileImage == null) {
                                  return const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 25,
                                    child: Icon(Icons.person),
                                  );
                                }
                                return Container(
                                  height: Screen.height(context) * 0.07,
                                  width: Screen.width(context) * 0.12,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: FileImage(
                                        File(_.profileImage?.path ?? ''),
                                      ),
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
                  RegistrationUserDetails(
                    formKey: formKeys[0],
                  ),
                  RegistrationAddressDetails(
                    formKey: formKeys[1],
                  ),
                  RegistrationAdditionalInformation(
                    formKey: formKeys[2],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
