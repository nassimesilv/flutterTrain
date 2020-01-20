import 'package:flutter/material.dart';
import 'package:koop/screens/barber_profile_screen.dart';
import 'package:koop/utils/constants.dart';

class SmallSlideItem extends StatelessWidget {
  final String barberId;
  final Image img;
  final String name;
  final String address;
  final String distance;
  final String rating;

  SmallSlideItem(
      {@required this.barberId,
      @required this.img,
      @required this.name,
      @required this.address,
      @required this.rating,
      @required this.distance});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BarberProfileScreen.title);
      },
      child: Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 2.9,
          width: MediaQuery.of(context).size.width / 1.2,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 6.0,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.asset(
                            'images/fakeBarberProfileImage.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 6.0,
                        right: 6.0,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: kRatingStarColor,
                                  size: 10,
                                ),
                                Text(
                                  ' $rating ',
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.0),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      '$name',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(height: 7.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          child: Text(
                            '$address',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Container(
                        child: Text(
                          '$distance km',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
