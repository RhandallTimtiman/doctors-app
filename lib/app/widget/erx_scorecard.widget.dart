import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:flutter/material.dart';

class ErxScoreCard extends StatelessWidget {
  final String title;
  final int count;
  final IconData icon;
  const ErxScoreCard({
    Key? key,
    required this.title,
    required this.count,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: Screen.getProportionateScreenHeight(
        context,
        88,
      ),
      padding: EdgeInsets.all(
        Screen.getProportionateScreenHeight(
          context,
          8,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ),
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: Screen.getProportionateScreenHeight(
                  context,
                  20,
                ),
              ),
              SizedBox(
                width: Screen.getProportionateScreenWidth(
                  context,
                  8,
                ),
              ),
              Text(
                title,
                style: textTheme.bodyText1!.copyWith(
                  color: Colors.white,
                  fontSize: Screen.getProportionateScreenHeight(
                    context,
                    16,
                  ),
                ),
              ),
            ],
          ),
          Text(
            count.toString(),
            style: textTheme.headline5!.copyWith(
              color: Colors.white,
              fontSize: Screen.getProportionateScreenHeight(
                context,
                28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
