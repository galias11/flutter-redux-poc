// @Vendors
import 'package:flutter/material.dart';

// @Theme
import 'package:workshop_twitter/theme/default/index.dart';

// @Model
import 'package:workshop_twitter/model/TimelineTweet.dart';

class TitleRow extends StatelessWidget {
  final TimelineTweet tweet;

  TitleRow({
    @required this.tweet
  });

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: 5.0,
            bottom: 5.0,
            left: 10.0,
            right: 10.0
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              tweet.avatarSource,
              height: 60,
              width: 60,
              fit: BoxFit.contain
            )
          )
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                tweet.publisherName,
                overflow: TextOverflow.ellipsis,
                style: FontTheme.fontTitlePrimary
              ),
              Text(
                tweet.publisherSource,
                style: FontTheme.fontTitleSecondary
              )
            ]
          )
        )
      ]
    );
  }
}