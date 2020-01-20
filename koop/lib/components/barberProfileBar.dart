import 'package:flutter/material.dart';
import 'package:koop/utils/constants.dart';

class BarberProfileBar extends StatelessWidget {
  const BarberProfileBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 70.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          BarberCircleAvatar(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: kRatingStarColor,
                          size: 20,
                        ),
                        Text(
                          '256',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '100',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          ' 4.3 ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Like',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Avis',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ButtonTheme(
                    minWidth: double.infinity,
                    buttonColor: Theme.of(context).accentColor,
                    child: RaisedButton(
                      child: Text(
                        'Prendre un RDV',
                        style: kButtonTextStyle,
                      ),
                      onPressed: () {
                        // TODO: ADD navigation to rdv screen
                        /* Navigator.pushReplacementNamed(
                            context, CGUScreen.title); */
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class BarberCircleAvatar extends StatelessWidget {
  final Image image;

  BarberCircleAvatar({this.image});

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
          minRadius: 20.0,
          maxRadius: 40.0,
          child: ClipOval(child: Image.asset('images/fakeCircleAvatar.jpg'))
          //TODO Add background Image
          ),
    );
  }
}
