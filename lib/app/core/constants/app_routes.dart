import 'package:consumer_app/app/data/models/models.dart';
import 'package:consumer_app/app/module/binding/binding.dart';
import 'package:consumer_app/app/module/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = [
    GetPage(
      name: '/',
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/main',
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: '/home',
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: '/registration',
      page: () => const RegistrationScreen(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: '/profile',
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: '/family-contact',
      page: () => const FamilyContactScreen(),
      binding: FamilyContactBinding(),
    ),
  ];

  static final List<DrawerItemModel> drawerRoutes = [
    DrawerItemModel(
      routeName: 'My Profile',
      icon: Icons.person,
      onTap: () {},
      width: 20,
    ),
    DrawerItemModel(
      routeName: 'My Order',
      icon: FontAwesomeIcons.bagShopping,
      onTap: () {},
      width: 20,
    ),
    DrawerItemModel(
      routeName: 'Favourite',
      icon: FontAwesomeIcons.heart,
      onTap: () {},
      width: 20,
    ),
    DrawerItemModel(
      routeName: 'Set Family & Contacts',
      icon: FontAwesomeIcons.peopleGroup,
      onTap: () {
        Get.toNamed('/family-contact');
      },
      width: 20,
    ),
    DrawerItemModel(
      routeName: 'Referral',
      icon: FontAwesomeIcons.peopleLine,
      onTap: () {},
      width: 20,
    ),
    DrawerItemModel(
      routeName: 'Promo and Updates',
      icon: FontAwesomeIcons.bell,
      onTap: () {},
      width: 20,
    ),
    DrawerItemModel(
      routeName: 'Rate Us!',
      icon: FontAwesomeIcons.star,
      onTap: () {},
      width: 20,
    ),
    DrawerItemModel(
      routeName: 'Contact Us!',
      icon: FontAwesomeIcons.star,
      onTap: () {},
      width: 20,
    ),
    DrawerItemModel(
      routeName: 'Settings',
      icon: FontAwesomeIcons.gear,
      onTap: () {},
      width: 20,
    ),
    DrawerItemModel(
      routeName: 'FAQ',
      icon: FontAwesomeIcons.file,
      onTap: () {},
      width: 20,
    ),
  ];
}
