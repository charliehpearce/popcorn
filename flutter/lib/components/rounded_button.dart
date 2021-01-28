import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {@required this.onPressed, @required this.colour, @required this.child});

  final Function onPressed;
  final Color colour;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Material(
        elevation: 0,
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 300,
          height: 42.0,
          child: child,
        ),
      ),
    );
  }
}
