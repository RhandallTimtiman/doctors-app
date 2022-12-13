import 'package:consumer_app/app/module/screen/screen.dart';
import 'package:consumer_app/app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: const MainDrawer(),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/ellipse_bg.png',
            width: double.infinity,
            fit: BoxFit.fill,
            height: size.height * .20,
          ),
          Positioned(
            child: Container(
              width: size.width,
              padding: const EdgeInsets.all(
                15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Hi Juan,',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            'Welcome Back!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(text: 'PHP '),
                                TextSpan(
                                  text: '1000',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'Load Balance',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              SizedBox(
                                height: size.height * .25,
                                width: double.infinity,
                                child: Card(
                                  elevation: 3,
                                  color: Colors.white.withOpacity(.9),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Recommendations',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromRGBO(88, 88, 88, 1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () =>
                                        Get.to(() => const CategoryScreen()),
                                    child: const Text(
                                      'View All >',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                height: size.height * .25,
                                width: double.infinity,
                                child: ListView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    CardRecommendation(
                                      height: 150,
                                      width: size.width * .42,
                                      label: 'Promo',
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    CardRecommendation(
                                      height: 150,
                                      width: size.width * .42,
                                      label: 'Most Search',
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    CardRecommendation(
                                      height: 150,
                                      width: size.width * .42,
                                      label: 'Another Card',
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    'News and Updates',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromRGBO(88, 88, 88, 1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'View All >',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.blue,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Card(
                                elevation: 5,
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 175,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Best Deals: LIMITED TIME OFFER',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromRGBO(88, 88, 88, 1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'View All >',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.blue,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Discount ends in',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromRGBO(88, 88, 88, 1),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  DiscountTimer(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: size.height * .45,
                                child: GridView(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 1.3,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  children: const [
                                    ItemCard(),
                                    ItemCard(),
                                    ItemCard(),
                                    ItemCard(),
                                    ItemCard(),
                                    ItemCard(),
                                    ItemCard(),
                                    ItemCard(),
                                    ItemCard(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
