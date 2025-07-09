import 'package:flutter/material.dart';
import 'package:islami_app/screen/tabs/radio/TabButton.dart';
import 'package:islami_app/them/app_theme.dart';

class TopTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const TopTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 55.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.black.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(20),
          border: null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabButton(
              index: 0,
              selectedIndex: selectedIndex,
              text: 'Radio',
              onTap: onTabSelected,
            ),
            TabButton(
              index: 1,
              selectedIndex: selectedIndex,
              text: 'Reciters',
              onTap: onTabSelected,
            ),
          ],
        ),
      ),
    );
  }
}
