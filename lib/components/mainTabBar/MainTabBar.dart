// @Vendors
import 'package:flutter/material.dart';

// @Theme
import 'package:workshop_twitter/theme/default/index.dart';

// @Constants
import 'package:workshop_twitter/constants/constants.dart';

AppBar mainAppBar({String title}) {
  return new AppBar(
    backgroundColor: ColorTheme.backgroundPrimary,
    bottom: TabBar(
      indicatorColor: ColorTheme.backgroundIndicator,
      tabs: [
        Tab(icon: Icon(
          Icons.home,
          color: ColorTheme.iconPrimary,
          size: MAIN_TAB_BAR_ICON_SIZE
        )),
        Tab(icon: Icon(
          Icons.search,
          color: ColorTheme.iconPrimary,
          size: MAIN_TAB_BAR_ICON_SIZE
        )),
        Tab(icon: Icon(
          Icons.settings,
          color: ColorTheme.iconPrimary,
          size: MAIN_TAB_BAR_ICON_SIZE
        )),
      ],
    ),
    title: Align(
      alignment: Alignment.centerLeft,
      child: Text(title)
    )
  );
}