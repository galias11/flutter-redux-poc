// @Vendors
import 'package:flutter/material.dart';

// @Theme
import 'package:workshop_twitter/theme/default/index.dart';

// @Custom icons
import 'package:workshop_twitter/assets/flutterIcons/customAppIcons.dart';

// @Model
import 'package:workshop_twitter/model/TimelineTweet.dart';

Widget buildICon(IconData icon, Color iconColor, double padding) {
  return Padding(
    padding: EdgeInsets.only(right: padding),
    child: Icon(
      icon,
      color: iconColor
    )
  );
}

Widget buildText(String count) {
  return new Text(
    count,
    style: FontTheme.fontBodyPrimary,
  );
}

Widget buildCounterRow(TimelineTweet tweet) {
  return new Padding(
    padding: EdgeInsets.only(
      top: 5.0,
      bottom: 5.0,
      left: 4.0,
      right: 8.0
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildICon(CustomAppIcons.favorite_border, ColorTheme.iconFavorite, 2.0),
            buildText(tweet.favCounter.toString())
          ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildICon(CustomAppIcons.retweet, ColorTheme.iconRetweet, 10.0),
            buildText(tweet.retweetCounter.toString())
          ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildICon(CustomAppIcons.comment_empty, ColorTheme.iconComment, 0.0)
          ]
        )
      ]
    )
  );
}