// @Vendors
import 'package:flutter/material.dart';

// @Model
import 'package:workshop_twitter/theme/default/fonts.dart';

Widget buildPositionCard(int position) {
  return new Expanded(
    flex: 2,
    child: Center(
      child: Text(
        position.toString(),
        style: FontTheme.fontPosition
      )
    )
  );
}