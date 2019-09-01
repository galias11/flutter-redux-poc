// @Vendors
import 'package:flutter/material.dart';

// @Model
import 'package:workshop_twitter/model/TimelineTweet.dart';

// @Components
import 'package:workshop_twitter/components/tweetDetails/TitleRow.TweetDetails.dart';
import 'package:workshop_twitter/components/tweetDetails/TweetBody.TweetDetails.dart';
import 'package:workshop_twitter/components/tweetDetails/CountersRow.TweetDetails.dart';
import 'package:workshop_twitter/components/tweetDetails/Footer.TweetDetails.dart';

class TweetDetails extends StatelessWidget {
  final TimelineTweet tweet;

  TweetDetails({
    @required this.tweet
  });

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TitleRow(tweet: tweet),
                    TweetBody(tweet: tweet),
                    CountersRow(tweet: tweet)
                  ]
                )
              )
            )
          ),
          FooterButtons()
        ]
      )
    );
  }
}