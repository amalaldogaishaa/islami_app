import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/them/app_theme.dart';

class NavBarselectedIcon extends StatelessWidget {
  NavBarselectedIcon({required this.imageName});
  String imageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(66),
        color: AppTheme.black.withValues(alpha: 0.6),
      ),
      child: SvgPicture.asset(
        'assets/icons/$imageName.svg',
        height: 22,
        width: 22,
        fit: BoxFit.fill,
        colorFilter: ColorFilter.mode(AppTheme.white, BlendMode.srcIn),
      ),
    );
  }
}
