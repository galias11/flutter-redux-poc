// @Vendors
import 'package:flutter/material.dart';

// @Model
import 'package:workshop_twitter/model/TimelineTweet.dart';

// @Subcomponents
import 'package:workshop_twitter/components/tweetTimelineCard/CountersRow.TweetTimelineCard.dart';

class TimelineFooter extends StatelessWidget {
  final TimelineTweet tweet;

  TimelineFooter({
    @required this.tweet
  });

  Widget buildContent() {
    if(tweet.imageSource == null) {
      return buildCounterRow(tweet);
    }
    return new Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 5.0),
          child: Image.network(tweet.imageSource)
        ),
        buildCounterRow(tweet)
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50.0),
      child: Container(
        child: buildContent()
      )
    );
  }
}