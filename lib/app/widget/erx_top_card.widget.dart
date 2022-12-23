import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:flutter/material.dart';

class ErxTopCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget content;
  const ErxTopCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.all(
        Screen.getProportionateScreenHeight(
          context,
          8,
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(
              0.5,
            ),
            blurRadius: 1,
            offset: const Offset(
              2,
              1,
            ),
          )
        ],
        border: Border.all(
          color: Colors.grey,
          width: 0.3,
        ),
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: Column(
        children: [
          Container(
            height: Screen.getProportionateScreenHeight(
              context,
              48,
            ),
            padding: EdgeInsets.all(
              Screen.getProportionateScreenHeight(
                context,
                12,
              ),
            ),
            decoration: const BoxDecoration(
              color: Color(0xff63a4ee),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  12,
                ),
                topRight: Radius.circular(
                  12,
                ),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: Screen.getProportionateScreenHeight(
                    context,
                    16,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: textTheme.bodyText1!.copyWith(
                    fontSize: Screen.getProportionateScreenHeight(
                      context,
                      16,
                    ),
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  12,
                ),
                bottomRight: Radius.circular(
                  12,
                ),
              ),
            ),
            child: content,
          ),
        ],
      ),
    );
  }
}
