import 'package:consumer_app/app/data/controller/controller.dart';
import 'package:consumer_app/app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends GetView<CategoryController> {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/bg.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: size.height * .15,
                child: Image.asset(
                  'assets/images/ods_logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Obx(
                  () => Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            controller.setActiveTab(0);
                          },
                          child: Container(
                            height: 75,
                            decoration: BoxDecoration(
                              color: controller.activeTab.value == 0
                                  ? const Color.fromRGBO(220, 237, 249, .7)
                                  : Colors.transparent,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.apps_rounded,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Categories',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            controller.setActiveTab(1);
                          },
                          child: Container(
                            height: 75,
                            decoration: BoxDecoration(
                              color: controller.activeTab.value != 0
                                  ? const Color.fromRGBO(220, 237, 249, .7)
                                  : Colors.transparent,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.apps_rounded,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'List of Brand',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => controller.activeTab.value == 1
                    ? const BrandList()
                    : const CategoryList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
