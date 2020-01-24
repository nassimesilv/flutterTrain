import 'package:flutter/material.dart';
import 'package:koop/components/cards/barberCard.dart';
import 'package:koop/models/barberCard.model.dart';
import 'package:koop/models/barberSlider.model.dart';
import 'package:koop/screens/vertical_slider_screen.dart';

const EdgeInsets sliderPadding = EdgeInsets.symmetric(horizontal: 10.0);
const double sizedBoxSize = 10.0;
const String seeAllButtonLabel = "Tout voir";
const TextStyle horizontalSliderTitleStyle = TextStyle(
  fontSize: 23,
  fontWeight: FontWeight.w800,
);

class HorizontalSlider extends StatelessWidget {
  final BarberSlider slider;

  HorizontalSlider({@required this.slider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: sliderPadding,
      child: Column(
        children: <Widget>[
          SizedBox(height: sizedBoxSize),
          HorizontalSliderTitle(slider: this.slider),
          Container(
            height: MediaQuery.of(context).size.height / 3.0,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: getBarberCards(slider.barberCardList),
            ),
          ),
          SizedBox(height: sizedBoxSize),
        ],
      ),
    );
  }
}

List<BarberCard> getBarberCards(List<BarberCardModel> barberCardModelList) {
  List<BarberCard> barberCardList = [];
  for (BarberCardModel model in barberCardModelList) {
    barberCardList.add(
      BarberCard(
        model: model,
      ),
    );
  }
  return barberCardList;
}

class HorizontalSliderTitle extends StatelessWidget {
  final BarberSlider slider;
  //TODO add route property to navigate to

  HorizontalSliderTitle({@required this.slider});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          this.slider.sliderTitle,
          style: horizontalSliderTitleStyle,
        ),
        FlatButton(
          child: Text(
            seeAllButtonLabel,
            style: TextStyle(
              color: Theme.of(context).accentColor,
              decoration: TextDecoration.underline,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => VerticalSliderScreen(
                  slider: this.slider,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
