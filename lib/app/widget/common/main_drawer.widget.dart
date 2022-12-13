import 'package:consumer_app/app/core/constants/app_routes.dart';
import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:consumer_app/app/data/models/models.dart';
import 'package:consumer_app/app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: Screen.width(context) * 0.7,
        height: Screen.height(context),
        child: Drawer(
          child: Container(
            padding: const EdgeInsets.all(0),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  height: Screen.height(context) * 0.2,
                  color: Theme.of(context).primaryColor,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: Screen.height(context) * 0.12,
                          width: Screen.width(context) * 0.22,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://p.kindpng.com/picc/s/668-6689202_avatar-profile-hd-png-download.png'),
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: Screen.width(context) * 0.03,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Hi Juan Dela Cruz',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                              ),
                              const Text(
                                '0912 345 7890',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                ),
                              ),
                              SizedBox(
                                height: Screen.height(context) * 0.02,
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.wallet,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'PHP 1000',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    FontAwesomeIcons.plus,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              const Text(
                                'Load Balance',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 7,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    itemCount: AppRoutes.drawerRoutes.length,
                    itemBuilder: (context, index) {
                      DrawerItemModel item = AppRoutes.drawerRoutes[index];
                      return DrawerItem(
                        routeName: item.routeName,
                        width: item.width,
                        onTap: item.onTap,
                        icon: item.icon,
                        isActive: index == 0,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
