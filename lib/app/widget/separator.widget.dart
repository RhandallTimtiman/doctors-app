import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final double height;
  final Color color;
  final bool isHorizontal;
  final int dashCountManipulator;
  final double dashWidth;
  const Separator({
    Key? key,
    this.height = 1,
    this.color = Colors.black,
    this.isHorizontal = false,
    this.dashCountManipulator = 2,
    this.dashWidth = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double box = isHorizontal
            ? constraints.constrainWidth()
            : constraints.constrainHeight();

        final dashHeight = height;
        int dashCount = (box / (dashCountManipulator * dashHeight)).floor();
        if (dashWidth > 1) {
          dashCount = (dashCount / dashWidth).floor();
        }
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: isHorizontal ? Axis.horizontal : Axis.vertical,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
