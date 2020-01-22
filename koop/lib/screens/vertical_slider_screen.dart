import 'package:flutter/material.dart';
import 'package:koop/components/cards/barberCard.dart';

const EdgeInsets sliderPadding = EdgeInsets.symmetric(horizontal: 10.0);
const double sizedBoxSize = 10.0;

class VerticalSliderScreen extends StatelessWidget {
  static final String title = 'vertical_slider_screen';
  final String sliderTitle;
  

  VerticalSliderScreen({this.sliderTitle});

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: sliderPadding,
        child: Column(
          children: <Widget>[
            SizedBox(height: sizedBoxSize),
            Expanded(
                          child: Container(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: getBarberCards('around'),
                ),
              ),
            ),
            SizedBox(height: sizedBoxSize),
          ],
        ),
      ),
    );
  }
}

class ScreenArguments {
  final String title;

  ScreenArguments(this.title);
}

List<BarberCard> getBarberCards(String sliderType) {
  // slider type property is for example favorites, around, trending, ...
  //TODO Request barber cards from backend
  List<BarberCard> barberCardList = [];
  const barberCardListLength = 5;
  for (int i = 0; i < barberCardListLength; i++) {
    barberCardList.add(
      BarberCard(
        barberId: i.toString(),
        distance: 2.5.toString(),
        address: '30B avenue du general sarrail, chalons en champagne',
        rating: '3.5',
        img: null,
        name: 'Barber Shop',
      ),
    );
  }
  return barberCardList;
}
