import 'package:consumer_app/app/core/constants/themes/app_theme_colors.dart';
import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:flutter/material.dart';

class ErxTopPatientContent extends StatelessWidget {
  const ErxTopPatientContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: Screen.getProportionateScreenHeight(
        context,
        Screen.height(context) * 0.35,
      ),
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: 2,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: Screen.getProportionateScreenHeight(
                    context,
                    8,
                  ),
                );
              },
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Screen.getProportionateScreenHeight(
                      context,
                      16,
                    ),
                    vertical: Screen.getProportionateScreenHeight(
                      context,
                      12,
                    ),
                  ),
                  color: index % 2 == 0
                      ? const Color.fromRGBO(
                          230,
                          239,
                          233,
                          1,
                        )
                      : Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Screen.width(context) * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Juan Dela Cruz',
                              style: textTheme.bodyText1!.copyWith(
                                fontSize: Screen.getProportionateScreenHeight(
                                  context,
                                  12,
                                ),
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '1000',
                        style: textTheme.bodyText1!.copyWith(
                          fontSize: Screen.getProportionateScreenHeight(
                            context,
                            12,
                          ),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Screen.getProportionateScreenHeight(
                context,
                12,
              ),
              vertical: Screen.getProportionateScreenHeight(
                context,
                10,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Text(
                    'View more >',
                    style: textTheme.bodyText1!.copyWith(
                      color: LightColors().secondary,
                      fontSize: Screen.getProportionateScreenHeight(
                        context,
                        12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
