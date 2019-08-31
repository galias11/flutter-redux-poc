// @Vendors
import 'dart:ui';

import 'package:flutter/material.dart';

// @Helpers
import 'package:workshop_twitter/helpers/dateHelper.dart';

// @Model
import 'package:workshop_twitter/model/TimelineTweet.dart';

// @Styles
import 'package:workshop_twitter/theme/default/index.dart';

Widget buildTitleRow(TimelineTweet tweet) {
  final String publiserSource = tweet.publisherSource;
  final String ellapsedTimeText = getTimeEllapsedText(tweet.creationTime);
  final String tweetDataText = '$publiserSource - $ellapsedTimeText';
  return new Padding(
    padding: EdgeInsets.only(
      top: 5.0,
      bottom: 5.0
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          tweet.publisherName,
          overflow: TextOverflow.ellipsis,
          style: FontTheme.fontTitlePrimary
        ),
        Text(
          tweetDataText,
          style: FontTheme.fontTitleSecondary
        )
      ]
    )
  );
}