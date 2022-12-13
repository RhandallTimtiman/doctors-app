import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:consumer_app/app/widget/widgets.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: ContainerBG(
          containerHeight: Screen.height(context),
          containerWidth: Screen.width(context),
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: Screen.width(context),
                        height:
                            Screen.getProportionateScreenHeight(context, 88),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                        child: Text(
                          'Ketoplast',
                          style: textTheme.headline6!.copyWith(
                            fontSize: Screen.getProportionateScreenHeight(
                              context,
                              32,
                            ),
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const Carousel(
                        carouselHeight: 300,
                      ),
                      SizedBox(
                        height:
                            Screen.getProportionateScreenHeight(context, 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Screen.width(context) * .8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ketoplast (Ketofren 30 mg Plasters 7 pcs)',
                                    style: textTheme.headline4!.copyWith(
                                      fontSize:
                                          Screen.getProportionateScreenHeight(
                                        context,
                                        24,
                                      ),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Icon(
                                Icons.favorite_border,
                                size: Screen.getProportionateScreenHeight(
                                  context,
                                  36,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: Screen.width(context) * .8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Php 200.00',
                                    style: textTheme.headline3!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    'Php 200.00',
                                    style: textTheme.headline4!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size:
                                            Screen.getProportionateScreenHeight(
                                          context,
                                          24,
                                        ),
                                        color: Colors.amber,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        '4.5',
                                        style: textTheme.headline2!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade800,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        '(17 Reviews)',
                                        style: textTheme.headline2!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade800,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.forward_rounded,
                                    size: Screen.getProportionateScreenHeight(
                                      context,
                                      36,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Separator(
                        isHorizontal: true,
                        dashWidth: 5,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: Screen.width(context) * .4,
                                  child: Text(
                                    'Distributor',
                                    style: textTheme.headline2!.copyWith(
                                      color: Colors.grey.shade800,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'One Pharma',
                                    style: textTheme.headline2!.copyWith(
                                      color: Colors.grey.shade800,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: Screen.width(context) * .4,
                                  child: Text(
                                    'Product Code',
                                    style: textTheme.headline2!.copyWith(
                                      color: Colors.grey.shade800,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '1021325',
                                    style: textTheme.headline2!.copyWith(
                                      color: Colors.grey.shade800,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: Screen.width(context) * .4,
                                  child: Text(
                                    'Shipping Weight',
                                    style: textTheme.headline2!.copyWith(
                                      color: Colors.grey.shade800,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '0 kg',
                                    style: textTheme.headline2!.copyWith(
                                      color: Colors.grey.shade800,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Separator(
                        isHorizontal: true,
                        dashWidth: 5,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(
                          16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Place of Origin',
                              style: textTheme.headline2!.copyWith(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Quezon City',
                              style: textTheme.headline2!.copyWith(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              'Description',
                              style: textTheme.headline2!.copyWith(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Ketoplast is a plaster of flesh-colored non-woven fabric coated transparent and adhesive substance and covered its solid surface with a thin paper. It is indicated for traumatic inflammation of the muscles, sprains, and strains',
                              style: textTheme.headline2!.copyWith(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Indications / Uses',
                              style: textTheme.headline2!.copyWith(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Traumatic inflammation of muscles, sprains and strains. Relief of symptoms of muscular pain.',
                              style: textTheme.headline2!.copyWith(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              'Warning',
                              style: textTheme.headline2!.copyWith(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Store at temperatures not exceeding 30degC',
                              style: textTheme.headline2!.copyWith(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Medical Prescription',
                              style: textTheme.headline2!.copyWith(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Medical Prescription required',
                              style: textTheme.headline2!.copyWith(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                height: Screen.height(context) * .1,
                width: double.infinity,
                child: Row(
                  children: [
                    SizedBox(
                      width: Screen.width(context) * .5,
                    ),
                    InkWell(
                      child: Container(
                        width: Screen.width(context) * .5,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(
                              40,
                            ),
                            bottomLeft: Radius.circular(
                              40,
                            ),
                          ),
                          color: Colors.greenAccent.shade100,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
