// @Vendors
import 'package:flutter/material.dart';

// @Model
import 'package:workshop_twitter/model/Trend.dart';

// @Components
import 'package:workshop_twitter/components/trendCard/TrendCard.dart';

// @Theme
import 'package:workshop_twitter/theme/default/index.dart';

// @i18n
import 'package:workshop_twitter/config/lang/i18n.dart';

class TrendList extends StatelessWidget {
  final Map state;

  TrendList({
    @required this.state
  });

  Widget buildHeader() {
    return new Padding(
      padding: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        bottom: 0
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: 20.0,
          bottom: 10.0
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ColorTheme.backgroundIndicator,
              width: 1.0
            )
          )
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            getTranslation('searchScreen', 'listTile'),
            style: FontTheme.fontScreenTitlePrimary,
          )
        )
      )
    );
  }

  Widget buildList() {
    return new Padding(
      padding: EdgeInsets.all(15.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: state['trendsData'].length,
        itemBuilder: (context, int index) {
          return TrendCard(
            position: index + 1,
            trend: state['trendsData'][index]
          );
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildHeader(),
            buildList()
          ]
        )
      )
    );
  }
}