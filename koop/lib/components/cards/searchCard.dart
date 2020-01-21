import 'package:flutter/material.dart';
import 'package:koop/screens/barber_profile_screen.dart';

const double cardCircularBorderRadius = 20.0;
const double cardPadding = 10.0;

class SearchCard extends StatelessWidget {
  final ImageProvider image;

  SearchCard({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.17,
      child: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardCircularBorderRadius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(cardCircularBorderRadius),
          child: Container(
            padding: EdgeInsets.all(cardPadding),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: image,
                colorFilter:
                    ColorFilter.mode(Colors.black54, BlendMode.hardLight),
              ),
            ),
            child: _columnWithContent(context),
          ),
        ),
      ),
    );
  }
}

_columnWithContent(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Expanded(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, BarberProfileScreen.title);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Barber  Shop',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                ),
              ),
              Text(
                '30 bis avenue du general sarrail, Chalons-en-Champagne',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  color: Colors.white,
                ),
              ),
              Text(
                '2.3 km',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      IconButton(
        icon: Icon(
          Icons.favorite_border,
          size: MediaQuery.of(context).size.height * 0.04,
          color: Theme.of(context).accentColor,
        ),
        onPressed: () {},
      ),
    ],
  );
}
