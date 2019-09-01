// @Vendors
import 'package:flutter/material.dart';

// @Model
import 'package:workshop_twitter/model/Trend.dart';

// @Styles
import 'package:workshop_twitter/theme/default/index.dart';

// @I18n
import 'package:workshop_twitter/config/lang/i18n.dart';

Widget buildTrendData(Trend trend) {
  final String hashtagText = trend.name;
  final int tweetCount = trend.tweetCount != null ? trend.tweetCount : 0;
  final String tweetCountText = getTranslation('searchScreen', 'tweetsCount', injectedTexts: [tweetCount.toString()]);
  return new Expanded(
    flex: 10,
    child: Padding(
      padding: EdgeInsets.only(
        right: 15.0,
        top: 10.0,
        bottom: 10.0
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 7.0),
            child: Text(
              hashtagText,
              overflow: TextOverflow.ellipsis,
              style: FontTheme.fontTitlePrimary
            )
          ),
          Text(
            tweetCountText,
            style: FontTheme.fontTitleSecondary
          )
        ]
      )
    )
  );
}