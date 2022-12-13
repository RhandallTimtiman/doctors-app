import 'package:flutter/material.dart';

class ContainerBG extends StatelessWidget {
  final double containerHeight;
  final double containerWidth;
  final Widget widget;

  const ContainerBG({
    Key? key,
    required this.containerHeight,
    required this.containerWidth,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      width: containerWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/bg.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: widget,
    );
  }
}
