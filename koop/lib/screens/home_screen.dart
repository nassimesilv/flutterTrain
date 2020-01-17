import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String title = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              pinned: false,
              snap: true,
              title: SearchBar(),
            ),
            SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: Text('List Item $index'),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(),
      ),
    );
  }
}

class FavoriteBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: getFavoritesCircleAvatar(),
        ),
      ),
    );
  }
}

class FavoriteCircleAvatar extends StatelessWidget {
  final Image image;

  FavoriteCircleAvatar({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        //TODO Add background Image
        // backgroundImage: image,
        backgroundColor: Colors.red,
      ),
    );
  }
}

List<FavoriteCircleAvatar> getFavoritesCircleAvatar() {
  //TODO Request favorites image from background
  List<FavoriteCircleAvatar> favoriteCircleAvatar = [];
  const favoriteCircleLength = 10;
  for (int i = 0; i < favoriteCircleLength; i++) {
    favoriteCircleAvatar.add(
      FavoriteCircleAvatar(
        image: null,
      ),
    );
  }
  return favoriteCircleAvatar;
}

class SearchBar extends StatelessWidget {
  final TextEditingController _searchControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Card(
        elevation: 6.0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: TextField(
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              hintText: "Rechercher..",
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              hintStyle: TextStyle(
                color: Colors.black,
              ),
            ),
            maxLines: 1,
            controller: _searchControl,
            onSubmitted: (String value) {
              //TODO: Add on search request
            },
          ),
        ),
      ),
    );
  }
}
