// @Vendors
import 'package:flutter/material.dart';

// @Helpers
import 'package:workshop_twitter/helpers/dateHelper.dart';

// @Theme
import 'package:workshop_twitter/theme/default/index.dart';

// @Model
import 'package:workshop_twitter/model/TimelineTweet.dart';

class TweetBody extends StatelessWidget {
  final TimelineTweet tweet;

  TweetBody({
    @required this.tweet
  });

  Widget buildImage(BuildContext context) {
    if(tweet.imageSource == null) {
      return Container();
    }
    return new Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Image.network(tweet.imageSource)
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: 15.0,
            bottom: 15.0
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              tweet.tweetBody,
              style: FontTheme.fontBodySection
            )
          )
        ),
        buildImage(context),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            formatDate(tweet.creationTime),
            style: FontTheme.fontTitleSecondary
          )
        )
      ]
    );
  }
}