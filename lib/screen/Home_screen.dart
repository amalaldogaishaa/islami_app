import 'package:flutter/material.dart';
import 'package:islami_app/screen/NavBarselectedIcon.dart';
import 'package:islami_app/screen/NavBarunselectedIcon.dart';
import 'package:islami_app/screen/tabs/hadeth_tab.dart';
import 'package:islami_app/screen/tabs/quran_tab.dart';
import 'package:islami_app/screen/tabs/radio_tab.dart';
import 'package:islami_app/screen/tabs/sebha_tab.dart';
import 'package:islami_app/screen/tabs/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    RadioTab(),
    SebhaTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (currentIndex == index) return;
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: NavBarunselectedIcon(imageName: 'quran'),
            activeIcon: NavBarselectedIcon(imageName: 'quran'),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: NavBarunselectedIcon(imageName: 'hadeth'),
            activeIcon: NavBarselectedIcon(imageName: 'hadeth'),
            label: 'Hadeth',
          ),
          BottomNavigationBarItem(
            icon: NavBarunselectedIcon(imageName: 'sebha'),
            activeIcon: NavBarselectedIcon(imageName: 'sebha'),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: NavBarunselectedIcon(imageName: 'radio'),
            activeIcon: NavBarselectedIcon(imageName: 'radio'),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: NavBarunselectedIcon(imageName: 'time'),
            activeIcon: NavBarselectedIcon(imageName: 'time'),
            label: 'Time',
          ),
        ],
      ),
    );
  }
}
