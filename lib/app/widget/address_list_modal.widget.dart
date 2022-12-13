import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressListModal extends StatelessWidget {
  final List<dynamic> list;
  final Function callback;
  const AddressListModal({
    Key? key,
    required this.list,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Screen.height(context) * 0.7,
      width: Screen.width(context) * 0.7,
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 5,
          );
        },
        itemCount: list.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              callback(
                list[index],
              );
              Get.back();
            },
            child: Text(
              list[index],
            ),
          );
        },
      ),
    );
  }
}
