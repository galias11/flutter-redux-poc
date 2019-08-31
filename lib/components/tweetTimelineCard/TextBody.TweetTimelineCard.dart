// @Vendors
import 'package:flutter/material.dart';

// @Theme
import 'package:workshop_twitter/theme/default/index.dart';

// @Model
import 'package:workshop_twitter/model/TimelineTweet.dart';

Widget builtTextBody(TimelineTweet tweet) {
  return new Padding(
    padding: EdgeInsets.only(
      bottom: 10.0
    ),
    child: Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        tweet.tweetBody,
        style: FontTheme.fontBodyPrimary
      )
    )
  );
}