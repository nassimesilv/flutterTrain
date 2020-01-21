import 'package:flutter/material.dart';
import 'package:koop/components/buttons/simpleButton.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class BarberProfileBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          BarberCircleAvatar(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RatingBarIndicator(
                      rating: 3.75,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 15.0,
                      direction: Axis.horizontal,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          '256',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Like',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          '100',
                          style: TextStyle(
                            fontSize: 15,
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
                SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SimpleButton(
                    label: 'Prendre un RDV',
                    onPressed: () {
                      // TODO: ADD navigation to rdv screen
                      /* Navigator.pushReplacementNamed(
                            context, CGUScreen.title); */
                    },
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
