import 'package:flutter/material.dart';
import 'package:koop/components/bars/searchBar.dart';
import 'package:koop/components/cards/searchCard.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<SearchCard> searchCardList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Expanded(
                      child: SearchBar2(
                        onSubmitted: () {
                          setState(() {
                            this.searchCardList = getSearchCards();
                            print('hello world');
                            print(this.searchCardList.length);
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

List<SearchCard> getSearchCards() {
  List<SearchCard> searchCardList = [];
  for (int i = 0; i < 20; i++) {
    searchCardList.add(
        SearchCard(image: AssetImage('images/fakeBarberImage${i % 3}.jpg')));
  }
  return searchCardList;
}
