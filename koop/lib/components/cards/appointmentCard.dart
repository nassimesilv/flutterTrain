import 'package:flutter/material.dart';
import 'package:koop/components/bars/barberProfileBar.dart';
import 'package:koop/components/bars/circleAvatarBar.dart';
import 'package:koop/components/cards/reviewPopup.dart';
import 'package:koop/utils/constants.dart';
import 'package:maps_launcher/maps_launcher.dart';

class AppointmentCard extends StatelessWidget {
  final bool isComing;

  AppointmentCard({@required this.isComing});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kCardBorderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FavoriteSquareAvatar(),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: Text('Barber Shop',
                        textAlign: TextAlign.start, style: TextStyle()),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    width: double.infinity,
                    child: Text('25/01/2020: 18h00 - 19h00',
                        textAlign: TextAlign.start, style: TextStyle()),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    width: double.infinity,
                    child: Text(
                        '30 Bis avenue du general sarrail, chalons en champagne',
                        textAlign: TextAlign.start,
                        style: TextStyle()),
                  ),
                ],
              ),
            ),
            this.isComing
                ? IconButton(
                    icon: Icon(Icons.directions),
                    onPressed: () {
                      MapsLauncher.launchCoordinates(37.4220041, -122.0862462);
                    },
                  )
                : IconButton(
                    icon: Icon(Icons.rate_review),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomDialog(
                          title: "Success",
                          description:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          buttonText: "Okay",
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
