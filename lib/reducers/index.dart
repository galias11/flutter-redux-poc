// @Vendors
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

// @Reducers
import 'package:workshop_twitter/reducers/timelineReducer.dart' as timelineReducer;
import 'package:workshop_twitter/reducers/tweetDetailsReducer.dart' as tweetDetailsReducer;

class AppState {
  final Map timeline;
  final Map tweetDetails;

  AppState({
    @required this.timeline,
    @required this.tweetDetails,
  });

  AppState.initialState():
    timeline = timelineReducer.initialState(),
    tweetDetails = tweetDetailsReducer.initialState();
}

AppState appStateReducer(AppState state, action) {
  return AppState(
    timeline: timelineReducer.timelineReducer(state.timeline, action),
    tweetDetails: tweetDetailsReducer.tweetDetailsReducer(state.tweetDetails, action)
  );
}

final tweetsStore = new Store<AppState>(
  appStateReducer,
  middleware: [thunkMiddleware],
  initialState: AppState.initialState()
);