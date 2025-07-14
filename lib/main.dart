import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:islami_app/screen/Home_screen.dart';
import 'package:islami_app/screen/onboarding_screen.dart';
import 'package:islami_app/them/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

  runApp(IslamiApp(hasSeenOnboarding: hasSeenOnboarding));
}

class IslamiApp extends StatelessWidget {
  final bool hasSeenOnboarding;

  const IslamiApp({super.key, required this.hasSeenOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routes: {
        HomeScreen.routName: (_) => HomeScreen(),
        OnboardingScreen.routeName: (_) => OnboardingScreen(),
      },
      initialRoute: hasSeenOnboarding
          ? HomeScreen.routName
          : OnboardingScreen.routeName,
    );
  }
}
