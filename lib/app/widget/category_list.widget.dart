import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        width: size.width,
        padding: const EdgeInsets.only(
          top: 10,
          left: 15,
          right: 15,
        ),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(220, 237, 249, 1),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    for (var i = 0; i < 20; i++)
                      GestureDetector(
                        onTap: () => Get.toNamed('/erx'),
                        child: Container(
                          height: size.height * .2,
                          width: size.width * .40,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                20,
                              ),
                            ),
                          ),
                          child: i == 1
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.prescription,
                                      size: Screen.getProportionateScreenHeight(
                                        context,
                                        48,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          Screen.getProportionateScreenHeight(
                                        context,
                                        24,
                                      ),
                                    ),
                                    Text(
                                      'ePrescription',
                                      style: textTheme.bodyText1!.copyWith(
                                        fontSize:
                                            Screen.getProportionateScreenHeight(
                                          context,
                                          14,
                                        ),
                                        color: const Color(0xff63a4ee),
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
