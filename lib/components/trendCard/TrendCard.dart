// @Vendors
import 'package:flutter/material.dart';

// @Model
import 'package:workshop_twitter/model/Trend.dart';

// @Subcomponents
import 'package:workshop_twitter/components/trendCard/Position.TrendCard.dart';
import 'package:workshop_twitter/components/trendCard/TrendData.TrendCard.dart';

// @Theme
import 'package:workshop_twitter/theme/default/index.dart';

class TrendCard extends StatelessWidget {
  final Trend trend;
  final int position;

  TrendCard({
    @required this.trend,
    @required this.position
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorTheme.borderPrimary,
            width: 1.0
          )
        )
      ),
      child: Row(
        children: <Widget>[
          buildPositionCard(position),
          buildTrendData(trend)
        ],
      )
    );
  }
}