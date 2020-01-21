import 'package:flutter/material.dart';
import 'package:koop/screens/barber_profile_screen.dart';
import 'package:koop/screens/cgu_screen.dart';
import 'package:koop/screens/home_screen.dart';
import 'package:koop/screens/login_screen.dart';
import 'package:koop/screens/sign_up_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // TODO: Handle restore if already signed in else show sign in page
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Koop',
      theme: themeData,
      initialRoute: HomeScreen.title,
      routes: {
        LoginScreen.title: (context) => LoginScreen(),
        SignUpScreen.title: (context) => SignUpScreen(),
        CGUScreen.title: (context) => CGUScreen(),
        HomeScreen.title: (context) => HomeScreen(),
        BarberProfileScreen.title: (context) => BarberProfileScreen(),
      },
    );
  }
}

ThemeData themeData = ThemeData.dark().copyWith(
  accentColor: Color(0xFFD4AF37),
  indicatorColor: Color(0xFFD4AF37),
);
