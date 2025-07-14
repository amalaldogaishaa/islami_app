import 'package:flutter/material.dart';
import 'package:islami_app/screen/Home_screen.dart';
import 'package:islami_app/screen/onboarding_page_item.dart';
import 'package:islami_app/them/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = '/';
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<Widget> pages = [
    OnboardingPageItem(
      imagePath: 'assets/images/welcome.png',
      title: '',
      subtitle: 'Welcome To Islmi App',
    ),
    OnboardingPageItem(
      imagePath: 'assets/images/welcome_islami.png',
      title: 'Welcome To Islami',
      subtitle: 'We Are Very Excited To Have You In Our Community',
    ),
    OnboardingPageItem(
      imagePath: 'assets/images/welcome_read_quran.png',
      title: 'Reading the Quran',
      subtitle: 'Read, and your Lord is the Most Generous',
    ),
    OnboardingPageItem(
      imagePath: 'assets/images/welcome_bearish.png',
      title: 'Bearish',
      subtitle: 'Praise the name of your Lord, the Most High',
    ),
    OnboardingPageItem(
      imagePath: 'assets/images/welcome_radio.png',
      title: 'Holy Quran Radio',
      subtitle:
          'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];

  void _nextPage() {
    if (currentIndex < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (currentIndex > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _finish() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);

    Navigator.of(context).pushReplacementNamed(HomeScreen.routName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (i) => setState(() => currentIndex = i),
            children: pages,
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentIndex > 0)
                  TextButton(
                    onPressed: _previousPage,
                    child: Text(
                      'Back',
                      style: TextStyle(color: AppTheme.primary),
                    ),
                  )
                else
                  SizedBox(width: 50),
                Row(
                  children: List.generate(pages.length, (i) {
                    final isActive = i == currentIndex;
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: isActive ? 20 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: isActive ? AppTheme.primary : AppTheme.gray,
                      ),
                    );
                  }),
                ),
                TextButton(
                  onPressed: currentIndex == pages.length - 1
                      ? _finish
                      : _nextPage,
                  child: Text(
                    currentIndex == pages.length - 1 ? 'Finish' : 'Next',
                    style: const TextStyle(color: AppTheme.primary),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
