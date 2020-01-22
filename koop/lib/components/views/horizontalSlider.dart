import 'package:flutter/material.dart';
import 'package:koop/components/views/homeScrollView.dart' as HomeScrollView;
import 'package:koop/screens/vertical_slider_screen.dart';
import 'package:koop/utils/constants.dart';

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
              children: HomeScrollView.getBarberCards('around'),
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
              decoration: TextDecoration.underline,
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, VerticalSliderScreen.title, arguments: ScreenArguments(this.title));
          },
        ),
      ],
    );
  }
}
