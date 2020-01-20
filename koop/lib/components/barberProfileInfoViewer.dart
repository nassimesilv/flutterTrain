import 'package:flutter/material.dart';
import 'package:koop/utils/constants.dart';
import 'package:maps_launcher/maps_launcher.dart';

class BarberProfileInfoViewer extends StatelessWidget {
  BarberProfileInfoViewer();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ButtonTheme(
          minWidth: double.infinity,
          buttonColor: Theme.of(context).accentColor,
          child: RaisedButton(
            child: Text(
              'Open localization',
              style: kButtonTextStyle,
            ),
            onPressed: () {
              MapsLauncher.launchCoordinates(37.4220041, -122.0862462);
            },
          ),
        ),
      ),
    );
  }
}
