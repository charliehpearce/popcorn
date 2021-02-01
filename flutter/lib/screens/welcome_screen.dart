// Welcome screen, go here if not logged in
import 'package:popcorn/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:popcorn/components/constants.dart';
import 'package:popcorn/screens/registration_screen.dart';
import 'package:popcorn/screens/login_screen.dart';
import 'package:popcorn/screens/landing_page.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColour,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/img/logo.png'),
                Text(
                  "Find Movies You'll Love",
                  style: TextStyle(fontSize: kFontSize, color: kTextColour),
                ),
                SizedBox(height: 50.0),
                RoundedButton(
                  onPressed: () {
                    // change this
                    Navigator.pushNamed(context, LandingPage.id);
                  },
                  colour: kAccentColour,
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.facebookSquare,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Log In With Facebook',
                        style: TextStyle(color: kTextColour),
                      ),
                    ],
                  ),
                ),
                RoundedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  colour: Color(0xff4DA8DA),
                  child: Text(
                    'Log In With Email',
                    style: TextStyle(color: kTextColour),
                  ),
                ),
                RoundedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  colour: Color(0xff4DA8DA),
                  child: Text(
                    'Register With',
                    style: TextStyle(color: kTextColour),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
