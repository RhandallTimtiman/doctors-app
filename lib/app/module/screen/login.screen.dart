import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:consumer_app/app/data/controller/controller.dart';
import 'package:consumer_app/app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromRGBO(
                55,
                48,
                154,
                0.2,
              ),
              Theme.of(context).primaryColor,
            ],
          ),
        ),
        height: Screen.height(context),
        width: Screen.width(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
              height: Screen.height(context) * 0.72,
              width: Screen.width(context) * 0.9,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: Screen.getProportionateScreenHeight(context, 24),
                  ),
                  AuthInputField(
                    label: 'Username',
                    obscureText: false,
                    hint: '',
                    isEnabled: true,
                    prefixIcon: Icons.person_outline_rounded,
                    controller: Get.find<LoginController>().usernameController,
                    isRequired: true,
                  ),
                  SizedBox(
                    height: Screen.getProportionateScreenHeight(context, 24),
                  ),
                  Obx(
                    () => AuthInputField(
                      label: 'Password',
                      obscureText:
                          Get.find<LoginController>().obscurePass.value,
                      callback: () {
                        Get.find<LoginController>().toggleObscurePass();
                      },
                      hint: '',
                      isEnabled: true,
                      prefixIcon: Icons.lock_rounded,
                      isPassword: true,
                      controller:
                          Get.find<LoginController>().passwordController,
                      isRequired: true,
                    ),
                  ),
                  SizedBox(
                    height: Screen.getProportionateScreenHeight(context, 12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Forget?',
                        style: TextStyle(
                          color: Color.fromRGBO(62, 128, 188, 1),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Screen.getProportionateScreenHeight(context, 12),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      color: Theme.of(context).primaryColor,
                      minWidth: double.infinity,
                      onPressed: () {
                        Get.toNamed('/main');
                      },
                      child: Text(
                        'Sign In',
                        style: textTheme.headline6!.copyWith(
                          fontSize: Screen.getProportionateScreenHeight(
                            context,
                            16,
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Screen.getProportionateScreenHeight(context, 24),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.grey,
                          height: 0.3,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          'or log in with',
                          style: textTheme.headline6!.copyWith(
                            fontSize: Screen.getProportionateScreenHeight(
                              context,
                              12,
                            ),
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.grey,
                          height: 0.3,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Screen.getProportionateScreenHeight(context, 24),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Stack(
                      children: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          color: const Color.fromRGBO(56, 119, 234, 1),
                          minWidth: double.infinity,
                          onPressed: () {},
                          child: Center(
                            child: Text(
                              'Facebook',
                              style: textTheme.headline6!.copyWith(
                                fontSize: Screen.getProportionateScreenHeight(
                                  context,
                                  16,
                                ),
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 12,
                          left: 40,
                          child: Icon(
                            Icons.facebook,
                            color: Colors.white,
                            size: Screen.height(context) * 0.035,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Screen.getProportionateScreenHeight(context, 12),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Stack(
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                          ),
                          onPressed: () {},
                          child: Container(
                            height: Screen.height(context) * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              color: Colors.white.withOpacity(0.5),
                            ),
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                'Google',
                                style: textTheme.headline6!.copyWith(
                                  fontSize: Screen.getProportionateScreenHeight(
                                    context,
                                    16,
                                  ),
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 12,
                          left: 40,
                          child: Image(
                            image: const AssetImage(
                              'assets/icons/google_icon.png',
                            ),
                            height: Screen.height(context) * 0.035,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Screen.getProportionateScreenHeight(context, 12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: textTheme.headline6!.copyWith(
                          fontSize: Screen.getProportionateScreenHeight(
                            context,
                            12,
                          ),
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/registration');
                        },
                        child: Text(
                          "Sign Up",
                          style: textTheme.headline6!.copyWith(
                            fontSize: Screen.getProportionateScreenHeight(
                              context,
                              16,
                            ),
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Screen.height(context) * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
