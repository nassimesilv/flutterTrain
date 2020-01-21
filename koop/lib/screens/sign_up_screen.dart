import 'package:flutter/material.dart';
import 'package:koop/components/forms/signUpForm.dart';
import 'package:koop/utils/constants.dart';

const double logoSize = 150.0;

class SignUpScreen extends StatelessWidget {
  static String title = 'sign_up_screen';

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
        // TODO: Loose focus on tap done on keyboard
        body: SafeArea(
          child: Padding(
            padding: kFormPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
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
                      ],
                    ),
                    SizedBox(height: kSizedBoxSize),
                    SignUpForm(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
