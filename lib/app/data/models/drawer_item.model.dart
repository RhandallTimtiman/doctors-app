import 'package:flutter/material.dart';

class DrawerItemModel {
  final String routeName;
  final IconData icon;
  final Function onTap;
  final double width;

  DrawerItemModel({
    required this.routeName,
    required this.icon,
    required this.onTap,
    required this.width,
  });
}
