import 'package:consumer_app/app/data/controller/controller.dart';
import 'package:consumer_app/app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: controller.customAppBar(controller.currentIndex.value),
      drawer: const MainDrawer(),
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: '/home',
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(
        () => Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          color: Theme.of(context).primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              controller.bottomNavCard(
                context,
                controller.currentIndex.value == 0,
                Icons.home,
                'Home',
                0,
              ),
              controller.bottomNavCard(
                  context,
                  controller.currentIndex.value == 1,
                  Icons.category,
                  'Category',
                  1),
              controller.bottomNavCard(
                  context,
                  controller.currentIndex.value == 2,
                  FontAwesomeIcons.bagShopping,
                  'My Order',
                  2),
              controller.bottomNavCard(
                  context,
                  controller.currentIndex.value == 3,
                  FontAwesomeIcons.heart,
                  'Favourite',
                  3),
              controller.bottomNavCard(
                context,
                controller.currentIndex.value == 4,
                Icons.person,
                'Profile',
                4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
