import 'package:flutter/material.dart';
import 'package:koop/components/views/horizontalSlider.dart';
import 'package:koop/models/barberSlider.model.dart';

const EdgeInsets sliderPadding = EdgeInsets.symmetric(horizontal: 10.0);
const double sizedBoxSize = 10.0;

class VerticalSliderScreen extends StatelessWidget {
  static final String title = 'vertical_slider_screen';
  final BarberSliderModel slider;

  VerticalSliderScreen({this.slider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryTextTheme.title.color,
        ),
        title: Text(slider.sliderTitle),
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
                  children: getBarberCards(slider.barberCardList),
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
