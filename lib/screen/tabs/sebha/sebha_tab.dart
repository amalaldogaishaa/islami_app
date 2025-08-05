import 'dart:math';

import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int highlightedBead = 0;
  double angle = 0;
  final List<String> tasbeehList = ['سبحان الله', 'الحمد لله', 'الله أكبر'];

  String get currentTasbeeh {
    int index = (counter ~/ 33) % tasbeehList.length;
    return tasbeehList[index];
  }

  void incrementCounter() {
    setState(() {
      angle += 15 * pi / 180;
      counter++;
      highlightedBead = (highlightedBead + 1) % 33;
    });
  }

  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Text(
            'سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              fontFamily: 'Janna',
            ),
          ),
          SizedBox(height: ScreenSize.height * 0.02),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset('assets/images/SebhaHeader.png'),
              Padding(
                padding: EdgeInsets.only(top: ScreenSize.width * 0.18),
                child: SizedBox(
                  width: ScreenSize.width * 0.85,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      InkWell(
                        onTap: incrementCounter,
                        child: Transform.rotate(
                          angle: angle,
                          child: Image.asset('assets/images/SebhaBody.png'),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            currentTasbeeh,
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Janna',
                                ),
                          ),
                          Text(
                            '$counter',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
