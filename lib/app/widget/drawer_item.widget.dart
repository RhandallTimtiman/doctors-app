import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerItem extends StatelessWidget {
  final String routeName;
  final IconData icon;
  final Function onTap;
  final double width;
  final bool isActive;
  const DrawerItem({
    Key? key,
    required this.routeName,
    required this.icon,
    required this.onTap,
    required this.width,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          height: Screen.height(context) * 0.07,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              12,
            ),
            color: isActive
                ? const Color.fromRGBO(156, 195, 169, 1)
                : Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          icon,
                          size: width,
                          color: isActive ? Colors.white : Colors.black,
                        ),
                        SizedBox(
                          width: Screen.width(context) * 0.1,
                        ),
                        Text(
                          routeName,
                          style: TextStyle(
                            color: isActive ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      FontAwesomeIcons.chevronRight,
                      size: 10,
                      color: isActive ? Colors.white : Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
