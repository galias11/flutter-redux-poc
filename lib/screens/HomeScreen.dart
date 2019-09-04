// @Vendors
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

// @Reducers
import 'package:workshop_twitter/reducers/index.dart';

// @Screens
import 'package:workshop_twitter/screens/TweetDetailsScreen.dart';

// @Theme
import 'package:workshop_twitter/theme/default/index.dart';

// @Helpers
import 'package:workshop_twitter/helpers/actionHelper.dart';
import 'package:workshop_twitter/helpers/navigationHelper.dart';

// @Components
import 'package:workshop_twitter/components/loadingSpinner/LoadingSpinner.dart';
import 'package:workshop_twitter/components/tweetTimelineCard/TweetTimelineCard.dart';
import 'package:workshop_twitter/components/emptyState/EmptyState.dart';

// @Actions
import 'package:workshop_twitter/actions/timeline.dart' as timelineActions;
import 'package:workshop_twitter/actions/tweetDetails.dart' as tweetDetailsActions;

// @i18n
import 'package:workshop_twitter/config/lang/i18n.dart';

class HomeScreen extends StatelessWidget {
  final ScrollController scrollController = ScrollController(
     initialScrollOffset: 0.0,
     keepScrollOffset: true
  );

  HomeScreen({Key key}) : super(key: key) {
    scrollController.addListener(this.onScrollListener);
  }

  void initScreen(Store<AppState> store) {
    dispatchAction(timelineActions.timelineFetchTweets);
  }

  void onScrollListener() {
    bool endReached = scrollController.offset == scrollController.position.maxScrollExtent;
    if(endReached) {
      dispatchAction(timelineActions.timelineFetchNextPage);
    }
  }

  void onRefresh() {
    dispatchAction(timelineActions.timelineFetchTweets);
  }

  void onTapTweet(BuildContext context, String tweetId) {
    dispatchAction(tweetDetailsActions.selecteTweet, args: {'tweetId': tweetId});
    navigate(context, new TweetDetailsScreen());
  }

  Widget buildPaginationLoader(context, state) {
    if(state['isPaginating']) {
      return loadingSpinner();
    }
    return Row();
  }

  Widget getContent(context, state) {
    if(state['isFetching']) {
      return loadingSpinner();
    }
    if(state['fetchError'] == true) {
      return EmptyState(message: getTranslation('homeScreen', 'emptyStateError'));
    }
    if(state['fetchSuccess'] == true && state['tweetData'].length == 0) {
      return EmptyState(message: getTranslation('homeScreen', 'emptyStateNoData'));
    }
    return  Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: state['tweetData'].length,
                itemBuilder: (context, int index) {
                  return TimelineCard(
                    onPress: onTapTweet,
                    tweet: state['tweetData'][index]
                  );
                }
              )
            )
          ),
          buildPaginationLoader(context, state)
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StoreConnector<AppState, Map>(
              onInit: initScreen,
              converter: (store) => {
                'tweetCount': store.state.timeline['tweetCount'].toString(),
                'isFetching': store.state.timeline['isFetching'],
                'isPaginating': store.state.timeline['isFetchingNextPage'],
                'fetchError': store.state.timeline['fetchError'],
                'fetchSuccess': store.state.timeline['fetchSuccess'],
                'tweetData': store.state.timeline['tweetData']
              },
              builder: getContent
            ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onRefresh,
        backgroundColor: ColorTheme.backgroundOverlay,
        child: Icon(
          Icons.refresh,
          color: ColorTheme.backgroundIndicator,
        )
      )
    );
  }
}