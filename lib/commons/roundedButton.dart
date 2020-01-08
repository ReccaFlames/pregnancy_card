import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedFlatButton extends StatelessWidget {

  final VoidCallback onPressed;
  final String displayedText;
  final double borderRadius;
  final Color color;

  RoundedFlatButton({
    this.onPressed,
    this.displayedText,
    this.borderRadius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(borderRadius == null ? 18.0 : borderRadius),
      ),
      color: color == null ? Theme.of(context).primaryColorDark : color,
      child: Text(
        displayedText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }

}