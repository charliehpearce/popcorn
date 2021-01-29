import 'package:flutter/material.dart';
import 'package:popcorn/components/constants.dart';

class MovieSwipeCard extends StatelessWidget {
  final Color widgetColour;
  MovieSwipeCard({this.widgetColour});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      width: 500,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          color: widgetColour),
    );
  }
}
