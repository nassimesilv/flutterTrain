import 'package:flutter/material.dart';
import 'package:koop/components/views/homeScrollView.dart';

const EdgeInsets sliderPadding = EdgeInsets.symmetric(horizontal: 10.0);
const double sizedBoxSize = 10.0;
const String seeAllButtonLabel = "Tout voir";
const TextStyle horizontalSliderTitleStyle = TextStyle(
  fontSize: 23,
  fontWeight: FontWeight.w800,
);

class HorizontalSlider extends StatelessWidget {
  final String sliderTitle;

  HorizontalSlider({@required this.sliderTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: sliderPadding,
      child: Column(
        children: <Widget>[
          SizedBox(height: sizedBoxSize),
          HorizontalSliderTitle(title: this.sliderTitle),
          Container(
            height: MediaQuery.of(context).size.height / 3.0,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: getBarberCards('around'),
            ),
          ),
          SizedBox(height: sizedBoxSize),
        ],
      ),
    );
  }
}

class HorizontalSliderTitle extends StatelessWidget {
  final String title;
  //TODO add route property to navigate to

  HorizontalSliderTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          this.title,
          style: horizontalSliderTitleStyle,
        ),
        FlatButton(
          child: Text(
            seeAllButtonLabel,
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
          onPressed: () {
            //TODO Add navigation to favorite view
          },
        ),
      ],
    );
  }
}
