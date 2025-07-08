import 'package:flutter/material.dart';
import 'package:islami_app/screen/tabs/quran/sura.dart';
import 'package:islami_app/them/app_theme.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = '/sura-details';
  @override
  Widget build(BuildContext context) {
    Sura sura = ModalRoute.of(context)!.settings.arguments as Sura;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(title: Text(sura.englishName)),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/details_header_left.png',
                  height: screenHeight * 0.1,
                  fit: BoxFit.fill,
                ),
                Text(
                  sura.arabicName,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall!.copyWith(color: AppTheme.primary),
                ),
                Image.asset(
                  'assets/images/details_header_right.png',
                  height: screenHeight * 0.1,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset(
            'assets/images/details_footer.png',
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
