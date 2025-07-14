import 'package:flutter/material.dart';
import 'package:islami_app/them/app_theme.dart';

class OnboardingPageItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const OnboardingPageItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/header.png',
                  height: MediaQuery.sizeOf(context).height * 0.20,
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(height: 10),
                Image.asset(
                  imagePath,
                  width: MediaQuery.sizeOf(context).height * 0.9,
                  height: MediaQuery.sizeOf(context).height * 0.5,
                ),
                const SizedBox(height: 10),
                if (title.isNotEmpty)
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: AppTheme.primary,
                      fontFamily: 'Janna',
                    ),
                  ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppTheme.primary,
                      fontFamily: 'Janna',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
