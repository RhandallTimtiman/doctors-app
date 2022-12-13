import 'dart:async';

import 'package:flutter/material.dart';

class DiscountTimer extends StatefulWidget {
  const DiscountTimer({Key? key}) : super(key: key);

  @override
  State<DiscountTimer> createState() => _DiscountTimerState();
}

class _DiscountTimerState extends State<DiscountTimer> {
  Duration _duration = const Duration(hours: 2);
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) => addTime());
  }

  void addTime() {
    const subtractSeconds = -1;

    setState(() {
      final seconds = _duration.inSeconds + subtractSeconds;

      if (seconds < 0) {
        timer?.cancel();
      } else {
        _duration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final hours = twoDigits(_duration.inHours.remainder(60));
    final minutes = twoDigits(_duration.inMinutes.remainder(60));
    final seconds = twoDigits(_duration.inSeconds.remainder(60));

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          height: 26,
          width: 26,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(
              73,
              130,
              61,
              1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                5,
              ),
            ),
          ),
          child: Center(
            child: Text(
              hours,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
          child: Center(
            child: Text(
              ':',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(
                  73,
                  130,
                  61,
                  1,
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(2),
          height: 26,
          width: 26,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(
              73,
              130,
              61,
              1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                5,
              ),
            ),
          ),
          child: Center(
            child: Text(
              minutes,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
          child: Center(
            child: Text(
              ':',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(
                  73,
                  130,
                  61,
                  1,
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(2),
          height: 26,
          width: 26,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(
              73,
              130,
              61,
              1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                5,
              ),
            ),
          ),
          child: Center(
            child: Text(
              seconds,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
