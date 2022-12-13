import 'package:flutter/cupertino.dart';

class Screen {
  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getProportionateScreenWidth(context, double inputWidth) {
    return (inputWidth / 375.0) * MediaQuery.of(context).size.width;
  }

  static double getProportionateScreenHeight(context, double inputWidth) {
    return (inputWidth / 812.0) * MediaQuery.of(context).size.height;
  }
}
