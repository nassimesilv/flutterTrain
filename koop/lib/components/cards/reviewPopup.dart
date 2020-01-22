import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:koop/components/bars/barberProfileBar.dart';
import 'package:koop/components/bars/circleAvatarBar.dart';
import 'package:koop/components/buttons/simpleButton.dart';
import 'package:koop/utils/constants.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kCardBorderRadius),
      ),
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(kCardBorderRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              BarberSquareAvatar(),
              Text(
                'Barber Shop',
                style: TextStyle(fontSize: 20.0),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                child: Card(
                  elevation: 6.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kCardBorderRadius)),
                  color: Colors.white,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kCardBorderRadius),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kCardBorderRadius),
                      ),
                      hintText: "Commentaire",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    maxLines: 4,
                    onSubmitted: (String value) {},
                  ),
                ),
              ),
              RatingBar(
                minRating: 1,
                direction: Axis.horizontal,
                itemSize: 35.0,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(width: kSizedBoxSize),
              Expanded(
                child: SimpleButton(
                  label: 'Annuler',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SizedBox(width: kSizedBoxSize),
              Expanded(
                child: SimpleButton(
                  label: 'Noter',
                  onPressed: () {
                    // TODO Send post review
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SizedBox(width: kSizedBoxSize),
            ],
          ),
        ],
      ),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
