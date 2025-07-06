import 'package:flutter/material.dart';
import 'package:islami_app/screen/Home_screen.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {HomeScreen.routName: (_) => HomeScreen()},
      initialRoute: HomeScreen.routName,
    );
  }
}
