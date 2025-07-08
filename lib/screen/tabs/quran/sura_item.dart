import 'package:flutter/material.dart';
import 'package:islami_app/screen/tabs/quran/sura.dart';

class SuraItem extends StatelessWidget {
  Sura sura;
  SuraItem(this.sura);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 52,
          width: 52,
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 24),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sura_numbere_frame.png'),
            ),
          ),
          child: Text(
            '${sura.num}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sura.englishName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              '${sura.ayatCount} Verses ',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
        Spacer(),
        Text(sura.arabicName, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
