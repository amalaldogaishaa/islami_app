import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/screen/tabs/hadeth/hadeth.dart';
import 'package:islami_app/screen/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islami_app/them/app_theme.dart';
import 'package:islami_app/widget/loading_indicator.dart';

class HadethItem extends StatefulWidget {
  int index;
  HadethItem({required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  Widget build(BuildContext context) {
    if (hadeth == null) {
      loadHadeth();
    }
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenHight = MediaQuery.sizeOf(context).height;

    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(HadethDetailsScreen.routeName, arguments: hadeth);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12, left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/hadeth_left.png',
                    height: screenHight * 0.1,
                    fit: BoxFit.fill,
                  ),
                  if (hadeth != null)
                    Expanded(
                      child: Text(
                        hadeth!.title,
                        textAlign: TextAlign.center,
                        style: textTheme.headlineSmall!.copyWith(
                          color: AppTheme.black,
                        ),
                      ),
                    ),
                  Image.asset(
                    'assets/images/hadeth_right.png',
                    height: screenHight * 0.1,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 14),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/hadithcardbackground1.png',
                    ),
                  ),
                ),
                child: hadeth == null
                    ? LoadingIndicator(color: AppTheme.black)
                    : ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        itemBuilder: (_, index) => Text(
                          hadeth!.content[index],
                          textAlign: TextAlign.center,
                          style: textTheme.titleMedium!.copyWith(
                            color: AppTheme.black,
                            fontFamily: 'Janna',
                          ),
                        ),
                        separatorBuilder: (_, __) => SizedBox(height: 4),
                        itemCount: hadeth!.content.length,
                      ),
              ),
            ),
            Image.asset(
              'assets/images/hadeth_footer.png',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadHadeth() async {
    String hadethFileContent = await rootBundle.loadString(
      'assets/textdata/h${widget.index + 1}.txt',
    );

    List<String> hadethLines = hadethFileContent.split('\n');
    String title = hadethLines[0];
    hadethLines.removeAt(0);
    List<String> content = hadethLines;
    hadeth = Hadeth(title: title, content: content, num: widget.index + 1);
    setState(() {});
  }
}
