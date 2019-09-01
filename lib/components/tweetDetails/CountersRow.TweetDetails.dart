// @Vendors
import 'package:flutter/material.dart';

// @Theme
import 'package:workshop_twitter/theme/default/index.dart';

// @Model
import 'package:workshop_twitter/model/TimelineTweet.dart';

// @i18n
import 'package:workshop_twitter/config/lang/i18n.dart';

class CountersRow extends StatelessWidget {
  final TimelineTweet tweet;

  CountersRow({
    @required this.tweet
  });

  String getLikeText() {
    return getTranslation('tweetDetailsScreen', 'favCount', injectedTexts: [tweet.favCounter.toString()]);
  }

  String getRetweetsText() {
    return getTranslation('tweetDetailsScreen', 'retweetCount', injectedTexts: [tweet.retweetCounter.toString()]);
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(
        top: 15.0,
        bottom: 15.0
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: ColorTheme.borderPrimary,
              width: 1.0
            ),
            bottom: BorderSide(
              color: ColorTheme.borderPrimary,
              width: 1.0
            )
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 30.0),
                child: Text(
                  getRetweetsText(),
                  style: FontTheme.fontTitleSecondary
                ),
              ),
              Text(
                getLikeText(),
                style: FontTheme.fontTitleSecondary
              )
            ],
          )
        )
      )
    );
  }
}