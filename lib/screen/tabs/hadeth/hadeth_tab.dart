import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/screen/tabs/hadeth/hadeth_item.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12, bottom: 20),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          enlargeFactor: 0.2,
          enlargeCenterPage: true,
          height: double.infinity,
        ),
        itemBuilder: (_, index, _) => HadethItem(index: index),
        itemCount: 50,
      ),
    );
  }
}
