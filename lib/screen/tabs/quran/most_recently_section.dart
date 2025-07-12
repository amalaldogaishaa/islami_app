import 'package:flutter/material.dart';
import 'package:islami_app/screen/tabs/quran/most_recently_item.dart';
import 'package:islami_app/screen/tabs/quran/quran_service.dart';

class MostRecentlySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: QuranService.mostRecentlySuras.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Most Recently',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.16,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => MostRecentlyItem(
                  QuranService.mostRecentlySuras.reversed.toList()[index],
                ),
                separatorBuilder: (_, __) => SizedBox(width: 10),
                itemCount: QuranService.mostRecentlySuras.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
