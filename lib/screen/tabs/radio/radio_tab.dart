import 'package:flutter/material.dart';
import 'package:islami_app/screen/tabs/radio/RadioList.dart';
import 'package:islami_app/screen/tabs/radio/RecitersList.dart';
import 'package:islami_app/screen/tabs/radio/TopTabs.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  @override
  int _selectedIndex = 0; // 0 for Radio, 1 for Reciters

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: TopTabs(
            selectedIndex: _selectedIndex,
            onTabSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 0.1),
            child: _buildBodyContent(),
          ),
        ),
      ],
    );
  }

  Widget _buildBodyContent() {
    if (_selectedIndex == 0) {
      return const RadioList();
    } else {
      return Reciterslist();
    }
  }
}
