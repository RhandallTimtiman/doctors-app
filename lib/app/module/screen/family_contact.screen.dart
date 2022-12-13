import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:consumer_app/app/data/controller/controller.dart';
import 'package:consumer_app/app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FamilyContactScreen extends GetView<FamilyContactController> {
  const FamilyContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => controller.openDrawer(),
          child: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
        ),
        backgroundColor: const Color.fromRGBO(
          73,
          130,
          61,
          1,
        ),
        elevation: 0,
      ),
      drawer: const MainDrawer(),
      body: Container(
        color: Colors.white,
        height: Screen.height(context),
        child: Column(
          children: [
            SizedBox(
              height: Screen.height(context) * 0.20,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/ellipse_bg.png',
                    width: double.infinity,
                    fit: BoxFit.fill,
                    height: Screen.height(context) * .2,
                  ),
                  Positioned(
                    top: Screen.height(context) * .03,
                    child: SizedBox(
                      width: Screen.width(context),
                      child: Column(
                        children: [
                          Center(
                            child: Material(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10000),
                              ),
                              elevation: 4,
                              child: GestureDetector(
                                onTap: () {},
                                child: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 25,
                                  child: Icon(Icons.person),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Screen.getProportionateScreenHeight(
                                context, 12),
                          ),
                          const Text(
                            'Juan Dela Cruz',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            '09123456789',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: Screen.height(context) * 0.15,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(FontAwesomeIcons.peopleGroup),
                                    SizedBox(
                                      width: Screen.width(context) * 0.04,
                                    ),
                                    const Text(
                                      'Set Family & Contacts',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Screen.getProportionateScreenHeight(
                                      context, 12),
                                ),
                                const Text(
                                  'Establish profile and store medifications for upto five(5) family members!',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: Screen.getProportionateScreenHeight(
                                      context, 24),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  InfoField(
                                    label: 'Full Name',
                                    obscureText: false,
                                    hint: 'Enter full name',
                                    isEnabled: true,
                                    prefixIcon: Icons.person_outline_rounded,
                                    controller: controller.fullNameController,
                                    isRequired: true,
                                  ),
                                  SizedBox(
                                    height: Screen.getProportionateScreenHeight(
                                        context, 24),
                                  ),
                                  InfoField(
                                    label: 'Email Address',
                                    obscureText: false,
                                    hint: 'Enter email name',
                                    isEnabled: true,
                                    prefixIcon: Icons.email,
                                    controller: controller.emailController,
                                    isRequired: true,
                                  ),
                                  SizedBox(
                                    height: Screen.getProportionateScreenHeight(
                                        context, 24),
                                  ),
                                  InfoField(
                                    label: 'Mobile Number',
                                    obscureText: false,
                                    hint: 'Enter mobile number',
                                    isEnabled: true,
                                    prefixIcon: Icons.email,
                                    controller: controller.mobileController,
                                    isRequired: true,
                                  ),
                                  MaterialButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    color: Theme.of(context).primaryColor,
                                    minWidth: double.infinity,
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: Screen.width(context) * 0.01,
                                        ),
                                        const Text(
                                          'Add Family',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
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
                              'Back',
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
                              'Edit',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
