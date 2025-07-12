import 'package:flutter/material.dart';
import 'package:islami_app/screen/tabs/hadeth/hadeth.dart';
import 'package:islami_app/them/app_theme.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = '/hadeth-details';

  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(title: Text('Hadeth${hadeth.num}')),
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
                Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    hadeth.title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: AppTheme.primary,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/details_header_right.png',
                  height: screenHeight * 0.1,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (_, index) => Text(
                hadeth.content[index],
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: AppTheme.primary),
                textAlign: TextAlign.center,
              ),
              separatorBuilder: (_, __) => SizedBox(height: 12),
              itemCount: hadeth.content.length,
            ),
          ),
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
