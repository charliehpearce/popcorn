// Screen that gives the reccomendations from the server
import 'package:flutter/material.dart';
import 'package:popcorn/components/swipe_card.dart';
import 'package:popcorn/components/constants.dart';

class ReccomendationPage extends StatefulWidget {
  @override
  _ReccomendationPageState createState() => _ReccomendationPageState();
}

class _ReccomendationPageState extends State<ReccomendationPage> {
  List<Widget> _swipeCards = [
    MovieSwipeCard(
      widgetColour: Colors.red,
      posterID: '1P3ZyEq02wcTMd3iE4ebtLvncvH',
    ),
    MovieSwipeCard(
      widgetColour: Colors.red,
      posterID: 'vzvKcPQ4o7TjWeGIn0aGC9FeVNu',
    ),
    MovieSwipeCard(widgetColour: Colors.blue)
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 50,
            width: double.infinity,
            child: Text(
              'Reccomended For You',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 30,
                  color: Color(0xff4DA8DA)),
            ),
          ),
          Draggable(
            child: _swipeCards[0],
            feedback: _swipeCards[0],
            childWhenDragging: _swipeCards[1],
          ),
        ],
      ),
    );
  }
}
