import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Import screens
import 'screens/welcome_screen.dart';
import 'screens/landing_page.dart';

void main() {
  runApp(Popcorn());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white, // Color for Android
      statusBarBrightness:
          Brightness.dark // Dark == white status bar -- for IOS.
      ));
}

class Popcorn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Open Sans'),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LandingPage.id: (context) => LandingPage(),
      },
    );
  }
}
