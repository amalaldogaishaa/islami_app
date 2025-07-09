import 'package:flutter/material.dart';
import 'package:islami_app/screen/tabs/radio/RadioCard.dart';

class RadioList extends StatelessWidget {
  const RadioList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: const [
        RadioCard(title: 'Radio Ibrahim Al-Akdar', isPlaying: false),
        RadioCard(title: 'Radio Al-Qaria Yassen', isPlaying: true),
        RadioCard(title: 'Radio Ahmed Al-trabuls', isPlaying: false),
        RadioCard(title: 'Radio Addokali Mohammad Alalim', isPlaying: false),
      ],
    );
  }
}
