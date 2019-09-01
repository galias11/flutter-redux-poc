// @Vendors
import 'package:flutter/material.dart';

// @Model
import 'package:workshop_twitter/model/TimelineTweet.dart';

// @Theme
import 'package:workshop_twitter/theme/default/index.dart';

// @SubComponentds
import 'package:workshop_twitter/components/tweetTimelineCard/AvatarAside.TweetTimelineCard.dart';
import 'package:workshop_twitter/components/tweetTimelineCard/TitleRow.TweetTimelineCard.dart';
import 'package:workshop_twitter/components/tweetTimelineCard/TextBody.TweetTimelineCard.dart';
import 'package:workshop_twitter/components/tweetTimelineCard/TweetFooter.TweetTimelineCard.dart';

class TimelineCard extends StatelessWidget {
  final TimelineTweet tweet;
  final Function onPress;

  TimelineCard({
    @required this.onPress,
    @required this.tweet
  });

  dynamic handleTapTweet(BuildContext context) {
    return () => onPress(context, tweet.strId);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: handleTapTweet(context),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ColorTheme.borderPrimary,
              width: 1.0
            )
          )
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 10.0,
            bottom: 10.0,
            left: 15.0
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildAvatarAside(tweet),
              Expanded(
                flex:10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildTitleRow(tweet),
                    builtTextBody(tweet),
                    TimelineFooter(tweet: tweet)
                  ]
                )
              )
            ]
          )
        )
      )
    );
  }
}