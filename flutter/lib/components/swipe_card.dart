import 'package:flutter/material.dart';
import 'package:popcorn/components/constants.dart';

class MovieSwipeCard extends StatelessWidget {
  final Color widgetColour;
  final String posterID;
  MovieSwipeCard({
    this.widgetColour,
    this.posterID,
  });

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width;
    double cardHeight = 0.65 * MediaQuery.of(context).size.height;

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Column(
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w400/$posterID.jpg',
              height: cardHeight - 100,
              width: cardWidth,
              fit: BoxFit.cover,
            ),
            Container(
              width: cardWidth,
              height: 100,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
