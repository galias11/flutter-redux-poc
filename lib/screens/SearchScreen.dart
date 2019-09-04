// @Vendors
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

// @Reducers
import 'package:workshop_twitter/reducers/index.dart';

// @Theme
import 'package:workshop_twitter/theme/default/index.dart';

// @Screens
import 'package:workshop_twitter/screens/TweetDetailsScreen.dart';

// @Helpers
import 'package:workshop_twitter/helpers/actionHelper.dart';
import 'package:workshop_twitter/helpers/navigationHelper.dart';

// @Components
import 'package:workshop_twitter/components/loadingSpinner/LoadingSpinner.dart';
import 'package:workshop_twitter/components/trendList/TrendList.dart';
import 'package:workshop_twitter/components/searchInput/SearchInput.dart';
import 'package:workshop_twitter/components/searchResultsList/SearchResultsList.dart';
import 'package:workshop_twitter/components/emptyState/EmptyState.dart';

// @Actions
import 'package:workshop_twitter/actions/trends.dart' as trendActions;
import 'package:workshop_twitter/actions/search.dart' as searchActions;
import 'package:workshop_twitter/actions/tweetDetails.dart' as tweetDetailsActions;

// @i18n
import 'package:workshop_twitter/config/lang/i18n.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key key}) : super(key: key);

  final textfieldController = TextEditingController();

  void initScreen(Store<AppState> store) {
    dispatchAction(trendActions.trendsFetch);
    textfieldController.text = store.state.search['searchValue'];
  }

  void handlePerformSearch() {
    dispatchAction(searchActions.requestSearch);
  }

  void handleChangeSearchValue(String value) {
    dispatchAction(searchActions.setSearchValue, args: {'value': value});
  }

  void handleTapTweet(BuildContext context, String tweetId) {
    dispatchAction(tweetDetailsActions.selecteTweet, args: {'tweetId': tweetId});
    navigate(context, new TweetDetailsScreen());
  }

  void handleResetSearch() {
    dispatchAction(searchActions.resetSearch);
  }

  Widget buildInnerContent(BuildContext context, state) {
    String emptyStateTranlationKey = 'error';
    if(state['isFetching'] || state['searchIsFetching']) {
      return Expanded(
        flex: 1,
        child: Center(
          child: loadingSpinner()
        )
      );
    }
    if(!state['searchPerformed'] && state['fetchSuccess'] && state['trendsData'].length > 0) {
      return  TrendList(state: state);
    }
    if(state['searchPerformed'] && state['searchSuccess'] && state['searchResults'].length > 0) {
      return SearchResultsList(
        onPress: handleTapTweet,
        state: state
      );
    }
    if(state['searchSuccess']) {
      emptyStateTranlationKey = 'noDataError';
    }
    return new EmptyState(message: getTranslation('searchScreen', emptyStateTranlationKey));
  }

  Widget buildContent(BuildContext context, state) {
    return new Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          SearchInput(
            onPerformSearch: handlePerformSearch,
            onChangeSearchValue: handleChangeSearchValue,
            textfieldController: textfieldController
          ),
          buildInnerContent(context, state)
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SizedBox(
        height: SizedBox.expand().height,
        child: Column(
          children: <Widget>[
            StoreConnector<AppState, Map>(
              onInit: initScreen,
              converter: (store) => {
                'searchIsFetching': store.state.search['isFetching'],
                'searchIsPaginating': store.state.search['isPaginating'],
                'searchSuccess': store.state.search['fetchSuccess'],
                'searchPerformed': store.state.search['searchPerformed'],
                'searchResults': store.state.search['tweetsData'],
                'isFetching': store.state.trends['isFetching'],
                'searchFetchError': store.state.search['fetchError'],
                'fetchSuccess': store.state.trends['fetchSuccess'],
                'trendsFetchError': store.state.trends['fetchError'],
                'trendsData': store.state.trends['trendsData']
              },
              builder: buildContent
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: handleResetSearch,
        backgroundColor: ColorTheme.backgroundOverlay,
        child: Icon(
          Icons.restore,
          color: ColorTheme.backgroundIndicator,
        )
      )
    );
  }
}