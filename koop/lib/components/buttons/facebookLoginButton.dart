import 'package:flutter/material.dart';
import 'package:koop/services/auth.service.dart';
import 'package:provider/provider.dart';

const TextStyle kButtonTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
const String fbIconPath = 'images/f_logo.png';
const Color fbColor = Color(0xFF4267B2);
const double fbButtonPadding = 8.0;
const double fbButtonIconSize = 24.0;
const String fbButtonText = 'Se connecter avec Facebook';
const EdgeInsets fbButtonTextPadding = EdgeInsets.only(left: 14.0, right: 10.0);

class FacebookSignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: fbColor,
      padding: EdgeInsets.all(fbButtonPadding),
      child: Row(
        children: <Widget>[
          Image.asset(
            fbIconPath,
            height: fbButtonIconSize,
            width: fbButtonIconSize,
          ),
          Padding(
            padding: fbButtonTextPadding,
            child: Text(
              fbButtonText,
              style: kButtonTextStyle,
            ),
          ),
        ],
      ),
      onPressed: () async {
        // TODO add fb auth function from button
        final isSuccess = await Provider.of<AuthService>(context, listen: false).signInWithFacebook();
        if (isSuccess == true) {
          print('success');
        }
      },
    );
  }
}
