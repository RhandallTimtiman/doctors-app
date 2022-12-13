import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:consumer_app/app/module/binding/binding.dart';
import 'package:consumer_app/app/module/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxInt currentIndex = 0.obs;
  final pages = <String>[
    '/home',
    '/home',
    '/home',
    '/home',
    '/profile',
  ];

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void changePage(int index) {
    if (currentIndex.value != index) {
      currentIndex.value = index;
      Get.toNamed(pages[index], id: 1);
    }
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/profile') {
      return GetPageRoute(
        settings: settings,
        page: () => const ProfileScreen(),
        binding: ProfileBinding(),
      );
    }

    if (settings.name == '/registration') {
      return GetPageRoute(
        settings: settings,
        page: () => const RegistrationScreen(),
        binding: RegistrationBinding(),
      );
    }

    if (settings.name == '/home') {
      return GetPageRoute(
        settings: settings,
        page: () => const HomeScreen(),
      );
    }

    if (settings.name == '/family-contact') {
      return GetPageRoute(
        settings: settings,
        page: () => const FamilyContactScreen(),
        binding: FamilyContactBinding(),
      );
    }
    if (settings.name == '/home') {
      return GetPageRoute(
        settings: settings,
        page: () => const FamilyContactScreen(),
        binding: FamilyContactBinding(),
      );
    }

    return null;
  }

  Widget bottomNavCard(BuildContext context, bool isActive, IconData icon,
      String label, int index) {
    return GestureDetector(
      onTap: () {
        changePage(index);
      },
      child: Container(
        constraints: BoxConstraints(
          minWidth: Screen.width(context) * 0.12,
        ),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          color: isActive
              ? const Color.fromRGBO(
                  38,
                  85,
                  20,
                  1,
                )
              : Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: Screen.height(context) * 0.04,
              color: Colors.white,
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 9,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar customAppBar(index) {
    if (index != 0) {
      return appBarWithSearch();
    }
    return AppBar(
      leading: GestureDetector(
        onTap: () => openDrawer(),
        child: const Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.search_rounded,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.shopping_basket,
                color: Colors.white,
                size: 30,
              )
            ],
          ),
        ),
      ],
      backgroundColor: const Color.fromRGBO(73, 130, 61, 1),
      elevation: 0,
    );
  }

  AppBar appBarWithSearch() {
    return AppBar(
      leading: GestureDetector(
        onTap: () => openDrawer(),
        child: const Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.search_rounded,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.shopping_basket,
                color: Colors.white,
                size: 30,
              )
            ],
          ),
        ),
      ],
      backgroundColor: const Color.fromRGBO(73, 130, 61, 1),
      elevation: 0,
    );
  }
}
