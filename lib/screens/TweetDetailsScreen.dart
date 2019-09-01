// @Vendors
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

// @Reducers
import 'package:workshop_twitter/reducers/index.dart';

// @Helpers
import 'package:workshop_twitter/helpers/actionHelper.dart';

// @Components
import 'package:workshop_twitter/components/regularAppBar/RegularAppBar.dart';
import 'package:workshop_twitter/components/tweetDetails/TweetDetails.dart';
import 'package:workshop_twitter/components/loadingSpinner/LoadingSpinner.dart';

// @Actions
import 'package:workshop_twitter/actions/tweetDetails.dart' as tweetDetailsActions;

// @i18n
import 'package:workshop_twitter/config/lang/i18n.dart';

class TweetDetailsScreen extends StatelessWidget {
  TweetDetailsScreen({Key key}) : super(key: key);

  void initScreen(Store<AppState> store) {
    dispatchAction(tweetDetailsActions.tweetDetaisFetch);
  }

  Widget buildContent(BuildContext context, state) {
    if(state['isFetching']) {
      return Expanded(
        flex: 1,
        child: Center(
          child: loadingSpinner()
        )
      );
    }
    if(state['fetchSuccess']) {
      return new TweetDetails(tweet: state['tweetData']);
    }
    return new Container();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: regularAppBar(title: getTranslation('tweetDetailsScreen', 'appBarTitle')),
      body: Column(
        children: <Widget>[
          StoreConnector<AppState, Map>(
            onInit: initScreen,
            converter: (store) => {
              'isFetching': store.state.tweetDetails['isFetching'],
              'fetchSuccess': store.state.tweetDetails['fetchSuccess'],
              'tweetData': store.state.tweetDetails['tweetData']
            },
            builder: buildContent
          )
        ],
      ),
    );
  }
}