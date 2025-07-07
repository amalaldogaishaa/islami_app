import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarunselectedIcon extends StatelessWidget {
  NavBarunselectedIcon({required this.imageName});
  String imageName;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$imageName.svg',
      height: 28,
      width: 28,
      fit: BoxFit.fill,
    );
  }
}
