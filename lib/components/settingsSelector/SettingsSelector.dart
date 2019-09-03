// @Vendors
import 'package:flutter/material.dart';

// @Theme
import 'package:workshop_twitter/theme/default/index.dart';

// @I18n
import 'package:workshop_twitter/config/lang/i18n.dart';

class SettingsSelector extends StatelessWidget {
  final Map filtersState;
  final dynamic onToggleFilter;

  SettingsSelector({
    @required this.filtersState,
    @required this.onToggleFilter
  });

  handleChangeCheckValue(String key) {
    onToggleFilter(key);
  }

  Widget buildTitleRow(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
        left: 15.0,
        right: 15.0
      ),
      decoration: BoxDecoration(
        color: ColorTheme.backgroundTitleTag
      ),
      child: Row(
        children: <Widget>[
          Text(
            getTranslation('settingsSreen', 'filtersTitle'),
            style: FontTheme.buttonGhost
          )
        ]
      )
    );
  }

  Widget buildCheckbox(BuildContext context, String filterId, String text, bool checkValue) {
    return new Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorTheme.borderPrimary,
            width: 1.0
          )
        )
      ),
      padding: EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
          left: 15.0,
          right: 15.0
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              style: FontTheme.fontBodyPrimary,
            ),
            Checkbox(
              onChanged: (value) => handleChangeCheckValue(filterId),
              value: checkValue
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildTitleRow(context),
          buildCheckbox(context, 'verified', getTranslation('settingsSreen', 'notVerifiedFilter'), filtersState['verified']),
          buildCheckbox(context, 'following', getTranslation('settingsSreen', 'notFollowingFilter'), filtersState['following']),
          buildCheckbox(context, 'defaultProfile', getTranslation('settingsSreen', 'notDefaultProfileFilter'), filtersState['defaultProfile']),
          buildCheckbox(context, 'links', getTranslation('settingsSreen', 'notLinksFilter'), filtersState['links']),
          buildCheckbox(context, 'truncated', getTranslation('settingsSreen', 'notTruncatedFilter'), filtersState['truncated'])
        ]
      )
    );
  }
}