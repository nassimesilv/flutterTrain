
import 'package:flutter/material.dart';
import 'package:koop/components/bars/circleAvatarBar.dart';
import 'package:koop/components/bars/searchBar.dart';
import 'package:koop/components/cards/barberCard.dart';

import 'horizontalSlider.dart';

class HomeScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height * 0.2,
          floating: true,
          pinned: false,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(110.0),
            child: Text(''),
          ),
          flexibleSpace: Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: SearchBar(),
                ),
                Expanded(
                  child: CircleAvatarBar(),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(getHorizontalSliders(),),
        )
      ],
    );
  }
}

List<HorizontalSlider> getHorizontalSliders() {
  List<HorizontalSlider> horizontalSliderList = [
    HorizontalSlider(sliderTitle: 'Dans le coin'),
    HorizontalSlider(sliderTitle: 'Tendances'),
    HorizontalSlider(sliderTitle: 'Favoris'),
  ];
  return horizontalSliderList;
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
