import 'package:flutter/material.dart';

class CardRecommendation extends StatelessWidget {
  final double height;
  final double width;
  final String label;

  const CardRecommendation({
    Key? key,
    required this.height,
    required this.width,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      child: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            const Expanded(
              child: SizedBox.shrink(),
            ),
            Container(
              height: 45,
              width: double.infinity,
              color: const Color.fromRGBO(
                73,
                130,
                61,
                1,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
