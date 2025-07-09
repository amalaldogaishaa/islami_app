import 'package:flutter/material.dart';
import 'package:islami_app/them/app_theme.dart';

class TabButton extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final String text;
  final Function(int) onTap;

  const TabButton({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 68, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: isSelected ? AppTheme.black : AppTheme.white,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
            fontFamily: 'Janna',
          ),
        ),
      ),
    );
  }
}
