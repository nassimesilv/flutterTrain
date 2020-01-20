import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController _searchControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Card(
        elevation: 6.0,
        color: Colors.white,
        child: TextField(
          style: TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
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
    );
  }
}
