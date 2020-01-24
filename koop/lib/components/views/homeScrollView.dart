import 'package:flutter/material.dart';
import 'package:koop/components/bars/circleAvatarBar.dart';
import 'package:koop/components/views/horizontalSlider.dart';
import 'package:koop/models/barberSlider.model.dart';

class HomeScrollView extends StatelessWidget {
  final List<BarberSlider> sliders;

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
            expandedHeight: MediaQuery.of(context).size.height * 0.12,
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

List<HorizontalSlider> getHorizontalSliders(List<BarberSlider> sliders) {
  List<HorizontalSlider> horizontalSliderList = [];

  for(BarberSlider slider in sliders) {
    horizontalSliderList.add(
      HorizontalSlider(slider: slider,)
    );
  }
  
  return horizontalSliderList;
}

