import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:koop/components/bars/circleAvatarBar.dart';
import 'package:koop/components/views/horizontalSlider.dart';
import 'package:koop/models/barberSlider.model.dart';
import 'package:koop/utils/constants.dart';

class HomeScrollView extends StatelessWidget {
  final List<BarberSliderModel> sliders;

  HomeScrollView({this.sliders});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KOOP'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height *
                kHomeAppBarExpandedHeightRatio,
            floating: true,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                child: Column(
                  children: <Widget>[
                    Expanded(child: CircleAvatarBar()),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              getHorizontalSliders(sliders),
            ),
          )
        ],
      ),
    );
  }
}

List<HorizontalSlider> getHorizontalSliders(List<BarberSliderModel> sliders) {
  List<HorizontalSlider> horizontalSliderList = [];

  for (BarberSliderModel slider in sliders) {
    horizontalSliderList.add(HorizontalSlider(
      slider: slider,
    ));
  }

  return horizontalSliderList;
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitRotatingCircle(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
