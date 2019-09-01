// @Vendors
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

// @Config
import 'package:workshop_twitter/config/navigation/SlideNavigation.dart';

void navigate(BuildContext context, Widget nextScreen) {
  Navigator.push(
    context,
    SlideLeftRoute(page: nextScreen)
  );
}