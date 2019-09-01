// @Model
import 'package:workshop_twitter/model/TimelineTweet.dart';

// @Action types
import 'package:workshop_twitter/constants/actionTypes.dart';

// @Helpers
import 'package:workshop_twitter/helpers/immutableHelper.dart';

Map initialState() {
  return {
    'selectedId': '',
    'isFetching': false,
    'fetchError': false,
    'fetchSuccess': false,
    'tweetData': null
  };
}

Map tweetDetailsReducer(Map state, dynamic action) {
  Map nextState = deepCloneMap(state);
  String actionType = action['type'];
  switch(actionType) {
    case TWEET_DETAILS_SELECT_TWEET:
      nextState['selectedId'] = action['payload']['tweetId'];
      return nextState;
    case TWEET_DETAILS_REQUEST_PERFORMED:
      nextState['isFetching'] = true;
      nextState['fetchError'] = false;
      nextState['fetchSuccess'] = false;
      nextState['tweetData'] = null;
      return nextState;
    case TWEET_DETAILS_REQUEST_FAILURE:
      nextState['isFetching'] = false;
      nextState['fetchError'] = true;
      return nextState;
    case TWEET_DETAILS_REQUEST_SUCCESS:
      nextState['isFetching'] = false;
      nextState['fetchSuccess'] = true;
      nextState['tweetData'] = TimelineTweet(action['payload']['data']);
      return nextState;
    default:
      return state;
  }
}