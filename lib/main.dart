import 'package:flutter/material.dart';
import 'package:islami_app/screen/Home_screen.dart';
import 'package:islami_app/screen/tabs/quran/quran_service.dart';
import 'package:islami_app/screen/tabs/quran/sura_details_screen.dart';
import 'package:islami_app/them/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await QuranService.getMostRecentlySuras();
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routName: (_) => HomeScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
      },
      initialRoute: HomeScreen.routName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
