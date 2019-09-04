// @Vendors
import 'dart:ui';
import 'package:flutter/material.dart';

// @Theme
import 'package:workshop_twitter/theme/default/index.dart';

class EmptyState extends StatelessWidget {
  final String message;

  EmptyState({
    @required this.message
  });

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: ColorTheme.backgroundPrimary
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'lib/assets/images/dead_twitter.jpeg',
                height: 200,
                width: 200
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  message,
                  style: FontTheme.fontEmptyState,
                  textAlign: TextAlign.center,
                )
              )
            ],
          )
        )
      )
    );
  }
}