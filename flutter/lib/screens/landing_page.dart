// holds the navigation bar
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:popcorn/components/bottom_navigation_buttons.dart';
import 'package:popcorn/components/constants.dart';
import 'package:popcorn/components/temp_nav.dart';
import 'package:popcorn/screens/reccomendation_page.dart';

class LandingPage extends StatefulWidget {
  static const String id = 'landing_page';
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;

  // List of pages to be rendered in each tab
  final List<Widget> _children = [
    ReccomendationPage(),
    TempNav(color: Colors.red),
    TempNav(color: Colors.green),
  ];

  // Update the UI when navigation index is changed
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body is set to the widget selected
      body: SafeArea(
        child: _children[_currentIndex],
      ),
      backgroundColor: kBackgroundColour,

      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        elevation: 0,
        selectedItemColor: kbottomNavigationBarIconSelectedColour,
        unselectedItemColor: kbottomNavigationBarIconUnSelectedColour,
        backgroundColor: kBackgroundColour,
        items: [
          kNavigationBarBottom(iconName: FontAwesomeIcons.atom),
          kNavigationBarBottom(iconName: FontAwesomeIcons.search),
          kNavigationBarBottom(iconName: FontAwesomeIcons.userCircle),
        ],
      ),
    );
  }
}
