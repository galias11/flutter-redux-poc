// @Vendors
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

// @Helpers
import 'package:workshop_twitter/helpers/actionHelper.dart';

// @Components
import 'package:workshop_twitter/components/loadingSpinner/LoadingSpinner.dart';
import 'package:workshop_twitter/components/tweetTimelineCard/TweetTimelineCard.dart';

// @Actions
import 'package:workshop_twitter/actions/timeline.dart';

class HomeScreen extends StatelessWidget {
  final Store<Map> store;
  final String title;
  final ScrollController scrollController = ScrollController(
     initialScrollOffset: 0.0,
     keepScrollOffset: true
  );

  HomeScreen({Key key, this.title, this.store}) : super(key: key) {
    scrollController.addListener(this.onScrollListener);
  }

  void initScreen() {
    dispatchAction(timelineFetchTweets, store);
  }

  void onScrollListener() {
    bool endReached = scrollController.offset == scrollController.position.maxScrollExtent;
    if(endReached) {
      print('pangor');
      dispatchAction(timelineFetchNextPage, store);
    }
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
    if(state['fetchSuccess'] == true) {
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
                    return TimelineCard(tweet: state['tweetData'][index]);
                  }
                )
              )
            ),
            buildPaginationLoader(context, state)
          ]
        )
      );
    }
    return Row();
  }

  @override
  Widget build(BuildContext context) {
    initScreen();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StoreConnector<Map, Map>(
              converter: (store) => {
                'tweetCount': store.state['tweetCount'].toString(),
                'isFetching': store.state['isFetching'],
                'isPaginating': store.state['isFetchingNextPage'],
                'fetchSuccess': store.state['fetchSuccess'],
                'tweetData': store.state['tweetData']
              },
              builder: getContent
            ),
          ],
        ),
      )
    );
  }
}