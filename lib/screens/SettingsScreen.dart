// @Vendors
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

// @Helpers
import 'package:workshop_twitter/helpers/actionHelper.dart';

// @Reducers
import 'package:workshop_twitter/reducers/index.dart';

// @Components
import 'package:workshop_twitter/components/settingsSelector/SettingsSelector.dart';

// @Actions
import 'package:workshop_twitter/actions/timeline.dart' as timelineActions;


class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key key}) : super(key: key);

  void handleToggleFilter(String filterId) {
    dispatchAction(timelineActions.toggleFilterEnabled, args: {'filterId': filterId});
  }

  Widget buildContent(BuildContext context, state) {
    return new SettingsSelector(
      filtersState: state['filtersState'],
      onToggleFilter: handleToggleFilter,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SizedBox(
        height: SizedBox.expand().height,
        child: StoreConnector<AppState, Map>(
          converter: (store) => {
            'filtersState': store.state.timeline['filtersState']
          },
          builder: buildContent
        )
      )
    );
  }
}