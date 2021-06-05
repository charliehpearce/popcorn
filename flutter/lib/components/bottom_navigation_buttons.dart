import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

BottomNavigationBarItem kNavigationBarBottom({IconData iconName}) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: FaIcon(iconName),
    ),
    label: '',
  );
}
