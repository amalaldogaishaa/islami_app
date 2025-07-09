import 'package:flutter/material.dart';
import 'package:islami_app/screen/tabs/radio/RadioCard.dart';

class Reciterslist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: const [
        RadioCard(title: 'Ibrahim Al-Akdar', isPlaying: false),
        RadioCard(title: 'Akram Alalaqmi', isPlaying: true),
        RadioCard(title: 'Majed Al-Enezi', isPlaying: false),
        RadioCard(title: 'Malik shaibat Alhamed', isPlaying: false),
      ],
    );
  }
}
