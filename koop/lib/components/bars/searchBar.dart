import 'package:flutter/material.dart';
import 'package:koop/utils/constants.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController _searchControl = TextEditingController();
  final Function onSubmitted;

  SearchBar({this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      child: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kCardBorderRadius)),
        color: Colors.white,
        child: TextField(
          style: TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kCardBorderRadius),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kCardBorderRadius),
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
            onSubmitted();
          },
        ),
      ),
    );
  }
}

class SearchBar2 extends StatelessWidget {
  final TextEditingController _searchControl = TextEditingController();
  final Function onSubmitted;

  SearchBar2({this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      child: TextField(
        style: TextStyle(
          color: Theme.of(context).primaryTextTheme.title.color,
        ),
        decoration: InputDecoration(
          hintText: "Rechercher..",
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).primaryTextTheme.title.color,
          ),
          hintStyle: TextStyle(
            color: Theme.of(context).primaryTextTheme.title.color,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).accentColor),
          ),
        ),
        maxLines: 1,
        controller: _searchControl,
        onSubmitted: (String value) {
          onSubmitted();
        },
      ),
    );
  }
}
