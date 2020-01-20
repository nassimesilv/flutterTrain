import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/fakeBarberProfileImage.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}
