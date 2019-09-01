// @Vendors
import 'package:flutter/material.dart';

// @Theme
import 'package:workshop_twitter/theme/default/index.dart';

// @Custom icons
import 'package:workshop_twitter/assets/flutterIcons/customAppIcons.dart';

class FooterButtons extends StatelessWidget {
  Widget buildICon(IconData icon, Color iconColor) {
    return new Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: iconColor,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(
          color: Colors.grey,
          blurRadius: 5.0,
          offset: Offset(
            2.5, // horizontal, move right 10
            2.5, // vertical, move down 10
          )
        )]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          child: Icon(
            icon,
            color: ColorTheme.iconGhost
          )
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 10.0,
        bottom: 15
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          buildICon(CustomAppIcons.favorite_border, ColorTheme.iconFavorite),
          buildICon(CustomAppIcons.retweet, ColorTheme.iconRetweet),
          buildICon(CustomAppIcons.comment_empty, ColorTheme.iconComment)
        ]
      )
    );
  }
}