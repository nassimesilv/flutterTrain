import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:koop/screens/barber_profile_screen.dart';
import 'package:koop/screens/cgu_screen.dart';
import 'package:koop/screens/home_screen.dart';
import 'package:koop/screens/login_screen.dart';
import 'package:koop/screens/sign_up_screen.dart';
import 'package:koop/screens/vertical_slider_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // TODO: Handle restore if already signed in else show sign in page
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.dark,
      data: (brightness) => brightness == Brightness.dark
          ? ThemeData.dark().copyWith(
              accentColor: Color(0xFFD4AF37),
              indicatorColor: Color(0xFFD4AF37),
              toggleableActiveColor: Color(0xFFD4AF37),
            )
          : ThemeData.light().copyWith(
              appBarTheme:
                  ThemeData.light().appBarTheme.copyWith(color: Colors.white),
              primaryTextTheme:
                  TextTheme(title: TextStyle(color: Colors.black)),
              accentColor: Color(0xFFD4AF37),
              indicatorColor: Color(0xFFD4AF37),
              toggleableActiveColor: Color(0xFFD4AF37),
            ),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          title: 'Koop',
          theme: theme,
          initialRoute: LoginScreen.title,
          routes: {
            LoginScreen.title: (context) => LoginScreen(),
            SignUpScreen.title: (context) => SignUpScreen(),
            CGUScreen.title: (context) => CGUScreen(),
            HomeScreen.title: (context) => HomeScreen(),
            BarberProfileScreen.title: (context) => BarberProfileScreen(),
            VerticalSliderScreen.title: (context) => VerticalSliderScreen(),
          },
        );
      },
    );
  }
}
