// @Vendors
import 'package:flutter/material.dart';

// @Colors
import 'package:workshop_twitter/theme/default/colors.dart';

class FontTheme {
  static TextStyle fontScreenTitlePrimary = new TextStyle(
    color: ColorTheme.fontPrimary,
    fontSize: 18,
    fontWeight: FontWeight.w700
  );

  static TextStyle fontTitlePrimary = new TextStyle(
    color: ColorTheme.fontPrimary,
    fontSize: 16,
    fontWeight: FontWeight.w700
  );

  static TextStyle fontTitleSecondary = new TextStyle(
    color: ColorTheme.fontDisabled,
    fontSize: 14,
    fontWeight: FontWeight.w600
  );

  static TextStyle fontBodyPrimary = new TextStyle(
    color: ColorTheme.fontPrimary,
    fontSize: 14,
    fontWeight: FontWeight.w400
  );

  static TextStyle fontBodySection = new TextStyle(
    color: ColorTheme.fontPrimary,
    fontSize: 16,
    fontWeight: FontWeight.w400
  );

  static TextStyle fontPosition = new TextStyle(
    color: ColorTheme.fontDisabled,
    fontSize: 18,
    fontWeight: FontWeight.w600
  );

  static TextStyle buttonGhost = new TextStyle(
    color: ColorTheme.fontGhost,
    fontSize: 14,
    fontWeight: FontWeight.w600
  );
}