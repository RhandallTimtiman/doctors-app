import 'package:consumer_app/app/core/constants/themes/app_theme_colors.dart';
import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:flutter/material.dart';

class ErxTopMedicineContent extends StatelessWidget {
  const ErxTopMedicineContent({Key? key}) : super(key: key);

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
                              'Ketoplast',
                              style: textTheme.bodyText1!.copyWith(
                                fontSize: Screen.getProportionateScreenHeight(
                                  context,
                                  12,
                                ),
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '100',
                              style: textTheme.bodyText1!.copyWith(
                                color: Colors.black,
                                fontSize: Screen.getProportionateScreenHeight(
                                  context,
                                  12,
                                ),
                              ),
                            ),
                            Text(
                              'Topical application of Ketoprofen on the joints or muscles can increase the drug concentration at the target site as well as lower the concentration in the systemic circulation, thereby reducing stomach irritations and liver toxicity.',
                              style: textTheme.bodyText1!.copyWith(
                                color: Colors.grey,
                                fontSize: Screen.getProportionateScreenHeight(
                                  context,
                                  12,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Qty: ',
                              style: textTheme.bodyText1!.copyWith(
                                color: Colors.black,
                                fontSize: Screen.getProportionateScreenHeight(
                                  context,
                                  10,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: '1000',
                              style: textTheme.bodyText1!.copyWith(
                                color: Colors.black,
                                fontSize: Screen.getProportionateScreenHeight(
                                  context,
                                  10,
                                ),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: ' / Patient: ',
                              style: textTheme.bodyText1!.copyWith(
                                color: Colors.black,
                                fontSize: Screen.getProportionateScreenHeight(
                                  context,
                                  10,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: '10',
                              style: textTheme.bodyText1!.copyWith(
                                color: Colors.black,
                                fontSize: Screen.getProportionateScreenHeight(
                                  context,
                                  10,
                                ),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
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
