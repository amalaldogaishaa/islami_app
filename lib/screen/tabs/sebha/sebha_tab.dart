import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int highlightedBead = 0;
  final List<String> tasbeehList = ['سبحان الله', 'الحمد لله', 'الله أكبر'];

  String get currentTasbeeh {
    int index = (counter ~/ 33) % tasbeehList.length;
    return tasbeehList[index];
  }

  void incrementCounter() {
    setState(() {
      counter++;
      highlightedBead = (highlightedBead + 1) % 33;
    });
  }

  @override
  Widget build(BuildContext context) {
    double sebhaSize = MediaQuery.sizeOf(context).width * 0.9;

    return Column(
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
        const SizedBox(height: 10),
        Positioned(
          child: Image.asset('assets/images/SebhaHeader.png', width: 100),
        ),
        Center(
          child: GestureDetector(
            onTap: incrementCounter,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/SebhaBody.png',
                  width: sebhaSize,
                  height: sebhaSize,
                  fit: BoxFit.fill,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      currentTasbeeh,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Janna',
                      ),
                    ),
                    const SizedBox(height: 8),
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
    );
  }
}
