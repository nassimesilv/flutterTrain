import 'package:flutter/material.dart';
import 'package:koop/components/smallSlideItem.dart';

class CGUScreen extends StatelessWidget {
  static String title = 'cgu_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SmallSlideItem(
        distance: 2.5.toString(),
        address: '30B avenue du general sarrail, chalons en champagne',
        rating: '3.5',
        img: null,
        name: 'Barber Shop',
      ),
    ) /* Center(
        child: Text('CGU...'),
      ), */
        );
  }
}
