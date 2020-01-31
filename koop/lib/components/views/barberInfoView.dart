import 'package:flutter/material.dart';
import 'package:koop/utils/constants.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

const EdgeInsets viewPadding =
    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0);
const String barberResume =
    'Fresh Cutz is a modern barber shop in the centre of Oslo. Our genius hair stylists will make your hair and beard dreams come true. Your best look tells a lot of stories, and our goal is to create unique and creative looks that represent you.';
const String barberAddress =
    '30 bis avenmue du general sarrail, chalons en champagne';
const String distance = '2.3km';
const String barberSchedule = 'Du lundi au samedi de 8h00 a 16h00';
const String barberNumber = '+33673786559';
const String barberMail = 'barbershop@gmail.com';
const String barberWebsite = 'https://www.hello.com';

class BarberInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: viewPadding,
        child: ListView(
          children: <Widget>[
            Text(barberResume),
            SizedBox(
              height: kSizedBoxSize,
            ),
            ListTile(
              onTap: () {
                MapsLauncher.launchCoordinates(37.4220041, -122.0862462);
              },
              leading: Icon(
                Icons.room,
              ),
              title: Text(barberAddress),
              subtitle: Text(distance),
            ),
            ListTile(
              leading: Icon(
                Icons.access_time,
              ),
              title: Text(barberSchedule),
            ),
            ListTile(
              onTap: () {
                launch('tel:$barberNumber');
              },
              leading: Icon(
                Icons.call,
              ),
              title: Text(barberNumber),
            ),
            ListTile(
              onTap: () {
                launch('mailto:$barberMail');
              },
              leading: Icon(
                Icons.mail_outline,
              ),
              title: Text(barberMail),
            ),
            ListTile(
              onTap: () {
                launch('$barberWebsite');
              },
              leading: Icon(
                Icons.public,
              ),
              title: Text(barberWebsite),
            ),
          ],
        ),
      ),
    );
  }
}
