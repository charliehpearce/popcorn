// Screen that gives the reccomendations from the server
import 'package:flutter/material.dart';
import 'package:popcorn/components/swipe_card.dart';

class ReccomendationPage extends StatefulWidget {
  @override
  _ReccomendationPageState createState() => _ReccomendationPageState();
}

class _ReccomendationPageState extends State<ReccomendationPage> {
  @override
  Widget build(BuildContext context) {
    return Draggable(
      child: MovieSwipeCard(
        widgetColour: Colors.red,
      ),
      feedback: MovieSwipeCard(
        widgetColour: Colors.red,
      ),
      childWhenDragging: MovieSwipeCard(
        widgetColour: Colors.blue,
      ),
    );
  }
}
