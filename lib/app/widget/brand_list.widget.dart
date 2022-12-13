import 'package:consumer_app/app/data/controller/category.controller.dart';
import 'package:consumer_app/app/module/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandList extends StatelessWidget {
  const BrandList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 10,
                left: 15,
                right: 15,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Color.fromRGBO(
                      220,
                      237,
                      249,
                      1,
                    ),
                  ),
                ),
                color: Color.fromRGBO(
                  220,
                  237,
                  249,
                  1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.find<CategoryController>().searchBrand(context);
                    },
                    child: const Text(
                      'A - Z',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(151, 151, 151, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var i = 0; i < 20; i++)
                        InkWell(
                          onTap: () {
                            Get.to(() => const CategoryItemsScreen());
                          },
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            decoration: BoxDecoration(
                              border: const Border(
                                top: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                ),
                              ),
                              color: i == 2
                                  ? const Color.fromRGBO(234, 240, 233, 1)
                                  : null,
                            ),
                            child: Row(
                              children: const [
                                Text(
                                  'Accurapil',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
