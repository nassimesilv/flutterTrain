import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:koop/components/bars/searchBar.dart';
import 'package:koop/components/cards/searchCard.dart';
import 'package:koop/models/barber.model.dart';
import 'package:koop/services/barberSliders.service.dart';
import 'package:koop/utils/constants.dart';

class SearchView extends StatefulWidget {
  final Position currentPosition;

  SearchView({this.currentPosition});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<SearchCard> searchCardList = [];
  List<BarberModel> barberSliderList;

  @override
  void initState() {
    super.initState();
    this.getSearchCardList();
  }

  void getSearchCardList() {
    this.barberSliderList = BarberSliderService().getSearchcards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * kSearchBarExpendedHeightRatio,
            floating: true,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: SearchBar2(
                        onSubmitted: () {
                          setState(() {
                            this.searchCardList = getSearchCards(this.barberSliderList);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              searchCardList,
            ),
          )
        ],
      ),
    );
  }
}

List<SearchCard> getSearchCards(List<BarberModel> modelList) {
  List<SearchCard> searchCardList = [];

  for(BarberModel model in modelList) {
    searchCardList.add(
      SearchCard(model: model)
    );
  }

  return searchCardList;
}
