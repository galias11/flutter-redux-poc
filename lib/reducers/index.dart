// @Vendors
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

// @Reducers
import 'package:workshop_twitter/reducers/timelineReducer.dart' as timelineReducer;
import 'package:workshop_twitter/reducers/trendsReducer.dart' as trendsReducer;
import 'package:workshop_twitter/reducers/tweetDetailsReducer.dart' as tweetDetailsReducer;
import 'package:workshop_twitter/reducers/searchReducer.dart' as searchReducer;

class AppState {
  final Map search;
  final Map timeline;
  final Map trends;
  final Map tweetDetails;

  AppState({
    @required this.search,
    @required this.timeline,
    @required this.trends,
    @required this.tweetDetails,
  });

  AppState.initialState():
    search = searchReducer.initialState(),
    timeline = timelineReducer.initialState(),
    trends = trendsReducer.initialState(),
    tweetDetails = tweetDetailsReducer.initialState();
}

AppState appStateReducer(AppState state, action) {
  return AppState(
    search: searchReducer.searchReducer(state.search, action),
    timeline: timelineReducer.timelineReducer(state.timeline, action),
    trends: trendsReducer.trendsReducer(state.trends, action),
    tweetDetails: tweetDetailsReducer.tweetDetailsReducer(state.tweetDetails, action)
  );
}

final tweetsStore = new Store<AppState>(
  appStateReducer,
  middleware: [thunkMiddleware],
  initialState: AppState.initialState()
);