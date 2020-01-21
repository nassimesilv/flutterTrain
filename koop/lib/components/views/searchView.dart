import 'package:flutter/material.dart';
import 'package:koop/components/bars/searchBar.dart';
import 'package:koop/components/cards/searchCard.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height * 0.12,
          floating: true,
          pinned: false,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              child: Column(
                children: <Widget>[
                  Expanded(child: SearchBar()),
                ],
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            getSearchCards(),
          ),
        )
      ],
    );
  }
}

List<SearchCard> getSearchCards() {
  List<SearchCard> searchCardList = [];
  for (int i = 0; i < 20; i++) {
    searchCardList.add(
      SearchCard(image: AssetImage('images/fakeBarberImage${i % 3}.jpg'))
    );
  }
  return searchCardList;
}
