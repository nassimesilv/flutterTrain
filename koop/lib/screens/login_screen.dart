import 'package:flutter/material.dart';
import 'package:koop/components/buttons/facebookLoginButton.dart';
import 'package:koop/components/forms/signInForm.dart';
import 'package:koop/screens/sign_up_screen.dart';
import 'package:koop/utils/constants.dart';

const double logoSize = 100.0;
const String appName = 'KOOP';
const double appNameFontSize = 60.0;
const String separatorText = 'OU';
const String noAccountText = 'Pas de compte?';
const String createAccountText = 'Créer un compte';

class LoginScreen extends StatelessWidget {
  static final String title = 'login_screen';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        // TODO: Bug keybord on top of field resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Padding(
            padding: kFormPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // TODO: Fix bug on keyboard showing first container hide
                Expanded(
                  flex: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Hero(
                            tag: kLogoHeroTag,
                            child: Container(
                              width: logoSize,
                              height: logoSize,
                              child: Image.asset(kLogoImagePath),
                            ),
                          ),
                          Text(appName,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .title
                                    .color,
                                fontSize: appNameFontSize,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                      SignInForm(),
                      SizedBox(height: kSizedBoxSize),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Divider(thickness: 2.0),
                          ),
                          SizedBox(width: 5.0),
                          Text(separatorText),
                          SizedBox(width: 5.0),
                          Expanded(
                            child: Divider(thickness: 2.0),
                          ),
                        ],
                      ),
                      SizedBox(height: kSizedBoxSize),
                      FacebookSignInButton(),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(noAccountText),
                      FlatButton(
                        padding: EdgeInsets.all(5.0),
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpScreen.title);
                        },
                        child: Text(
                          createAccountText,
                          style: kUnderlineText,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
