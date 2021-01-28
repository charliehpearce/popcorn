import 'package:flutter/material.dart';

// Import screens
import 'screens/welcome_screen.dart';
import 'screens/search.dart';
import 'screens/landing_page.dart';

void main() {
  runApp(Popcorn());
}

class Popcorn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LandingPage.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        SearchPage.id: (context) => SearchPage(),
        LandingPage.id: (context) => LandingPage(),
      },
    );
  }
}
