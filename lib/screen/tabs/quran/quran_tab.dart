import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/screen/tabs/quran/most_recently_section.dart';
import 'package:islami_app/screen/tabs/quran/quran_service.dart';
import 'package:islami_app/screen/tabs/quran/sura.dart';
import 'package:islami_app/screen/tabs/quran/sura_details_screen.dart';
import 'package:islami_app/screen/tabs/quran/sura_item.dart';
import 'package:islami_app/them/app_theme.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            style: Theme.of(context).textTheme.titleMedium,
            decoration: InputDecoration(
              hintText: 'Sura Name',
              prefixIcon: SvgPicture.asset(
                'assets/icons/quran.svg',
                colorFilter: ColorFilter.mode(
                  AppTheme.primary,
                  BlendMode.srcIn,
                ),
                height: 28,
                width: 28,
                fit: BoxFit.scaleDown,
              ),
            ),
            onChanged: (query) {
              QuranService.searchSura(query);
              setState(() {});
            },
          ),
        ),
        MostRecentlySection(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                onTap: () async {
                  QuranService.addSuraToMostRecently(sura);
                  await Navigator.of(
                    context,
                  ).pushNamed(SuraDetailsScreen.routeName, arguments: sura);
                  setState(() {});
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
