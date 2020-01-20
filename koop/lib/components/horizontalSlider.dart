import 'package:flutter/material.dart';
import 'package:koop/screens/home_screen.dart';

class HorizontalSlider extends StatelessWidget {
  final String sliderTitle;

  HorizontalSlider({@required this.sliderTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          HorizontalSliderTitle(title: this.sliderTitle),
          Container(
            height: MediaQuery.of(context).size.height / 2.4,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: getSmallSlideItems('around'),
            ),
          ),
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
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
        FlatButton(
          child: Text(
            "Tout voir",
            style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
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
