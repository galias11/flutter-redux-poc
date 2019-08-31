// @Vendors
import 'package:flutter/material.dart';

// @Model
import 'package:workshop_twitter/model/TimelineTweet.dart';

Widget buildAvatarAside(TimelineTweet tweet) {
  return new Expanded(
    flex: 2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            right: 10,
            left: 0
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              tweet.avatarSource,
              fit: BoxFit.contain
            )
          )
        )
      ]
    )
  );
}