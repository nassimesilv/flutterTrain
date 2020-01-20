import 'package:flutter/material.dart';
import 'package:koop/components/buttons/simpleButton.dart';
import 'package:maps_launcher/maps_launcher.dart';

class BarberInfoView extends StatelessWidget {
  BarberInfoView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SimpleButton(
          label: 'Open localization',
          onPressed: () {
            MapsLauncher.launchCoordinates(37.4220041, -122.0862462);
          },
        ),
      ),
    );
  }
}
