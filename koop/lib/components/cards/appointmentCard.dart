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
    return Container(
      height: MediaQuery.of(context).size.height * kAppointmentCardHeightRatio,
      child: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kCardBorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: FavoriteSquareAvatar(),
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Container(
                        width: double.infinity,
                        child: Text('Barber Shop',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle()),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        width: double.infinity,
                        child: Text('25/01/2020: 18h00 - 19h00',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle()),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        width: double.infinity,
                        child: Text(
                            '30 Bis avenue du general sarrail, chalons en champagne',
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.start,
                            style: TextStyle()),
                      ),
                    ),
                  ],
                ),
              ),
              this.isComing
                  ? IconButton(
                      icon: Icon(Icons.directions),
                      onPressed: () {
                        MapsLauncher.launchCoordinates(
                            37.4220041, -122.0862462);
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
      ),
    );
  }
}
