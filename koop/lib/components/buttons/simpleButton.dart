import 'package:flutter/material.dart';

const TextStyle kButtonTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

class SimpleButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  SimpleButton({
    this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      buttonColor: Theme.of(context).accentColor,
      minWidth: double.infinity,
      child: RaisedButton(
        child: Text(
          this.label,
          style: kButtonTextStyle,
        ),
        onPressed: this.onPressed,
      ),
    );
  }
}