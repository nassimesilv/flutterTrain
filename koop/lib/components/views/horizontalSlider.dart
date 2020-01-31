import 'package:flutter/material.dart';
import 'package:koop/components/cards/barberCard.dart';
import 'package:koop/models/barber.model.dart';
import 'package:koop/models/barberSlider.model.dart';
import 'package:koop/screens/vertical_slider_screen.dart';
import 'package:koop/utils/constants.dart';

const EdgeInsets sliderPadding = EdgeInsets.symmetric(horizontal: 10.0);
const double sizedBoxSize = 10.0;
const String seeAllButtonLabel = "Tout voir";
const TextStyle horizontalSliderTitleStyle = TextStyle(
  fontWeight: FontWeight.w800,
);

class HorizontalSlider extends StatelessWidget {
  final BarberSliderModel slider;

  HorizontalSlider({@required this.slider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: sliderPadding,
      child: Container(
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * kSpaceBettweenSlidersRatio),
        height: MediaQuery.of(context).size.height * kSliderHeightRatio,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: HorizontalSliderTitle(slider: this.slider),
            ),
            Expanded(
              flex: 10,
              child: Container(
                height:
                    MediaQuery.of(context).size.height * kSliderCardHeightRatio,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: getBarberCards(slider.barberCardList),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<BarberCard> getBarberCards(List<BarberModel> barberModelList) {
  List<BarberCard> barberCardList = [];
  for (BarberModel model in barberModelList) {
    barberCardList.add(
      BarberCard(
        model: model,
      ),
    );
  }
  return barberCardList;
}

class HorizontalSliderTitle extends StatelessWidget {
  final BarberSliderModel slider;
  //TODO add route property to navigate to

  HorizontalSliderTitle({@required this.slider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              this.slider.sliderTitle,
              style: horizontalSliderTitleStyle,
            ),
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
      ),
    );
  }
}
