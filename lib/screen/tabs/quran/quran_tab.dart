import 'package:flutter/material.dart';
import 'package:islami_app/screen/tabs/quran/quran_service.dart';
import 'package:islami_app/screen/tabs/quran/sura.dart';
import 'package:islami_app/screen/tabs/quran/sura_details_screen.dart';
import 'package:islami_app/screen/tabs/quran/sura_item.dart';
import 'package:islami_app/them/app_theme.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Text(
            'Suras list',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (_, index) {
              Sura sura = QuranService.suras[index];
              return InkWell(
                onTap: () {
                  Navigator.of(
                    context,
                  ).pushNamed(SuraDetailsScreen.routeName, arguments: sura);
                },
                child: SuraItem(sura),
              );
            },
            itemCount: QuranService.suras.length,
            separatorBuilder: (_, index) => Divider(
              thickness: 1,
              color: AppTheme.white,
              indent: screenWidth * 0.1,
              endIndent: screenWidth * 0.1,
            ),
          ),
        ),
      ],
    );
  }
}
