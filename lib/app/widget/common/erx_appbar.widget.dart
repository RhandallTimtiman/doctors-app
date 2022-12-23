import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErxAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const ErxAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
        ),
        splashRadius: Screen.getProportionateScreenHeight(
          context,
          24,
        ),
        onPressed: () => Get.back(),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.menu,
          ),
          splashRadius: Screen.getProportionateScreenHeight(
            context,
            24,
          ),
          onPressed: () {},
        ),
      ],
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(
        title,
        style: textTheme.headline1!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
