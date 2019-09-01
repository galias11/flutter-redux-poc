// @Vendors
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

// @Reducers
import 'package:workshop_twitter/reducers/index.dart';

// @Helpers
import 'package:workshop_twitter/helpers/actionHelper.dart';

// @Components
import 'package:workshop_twitter/components/loadingSpinner/LoadingSpinner.dart';
import 'package:workshop_twitter/components/trendList/TrendList.dart';
import 'package:workshop_twitter/components/searchInput/SearchInput.dart';

// @Actions
import 'package:workshop_twitter/actions/trends.dart' as trendActions;

class SearchScreen extends StatelessWidget {
  SearchScreen({Key key}) : super(key: key);

  void initScreen(Store<AppState> store) {
    dispatchAction(trendActions.trendsFetch);
  }

  Widget buildInnerContent(BuildContext context, state) {
    if(state['isFetching']) {
      return Expanded(
        flex: 1,
        child: Center(
          child: loadingSpinner()
        )
      );
    }
    if(state['fetchSuccess']) {
      return  TrendList(state: state);
    }
    return new Container();
  }

  Widget buildContent(BuildContext context, state) {
    return new Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          SearchInput(),
          buildInnerContent(context, state)
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          StoreConnector<AppState, Map>(
            onInit: initScreen,
            converter: (store) => {
              'isFetching': store.state.trends['isFetching'],
              'fetchSuccess': store.state.trends['fetchSuccess'],
              'trendsData': store.state.trends['trendsData']
            },
            builder: buildContent
          )
        ],
      ),
    );
  }
}