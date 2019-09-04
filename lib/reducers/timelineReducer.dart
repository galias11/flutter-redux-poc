// @Model
import 'package:workshop_twitter/model/TimelineTweet.dart';

// @Action types
import 'package:workshop_twitter/constants/actionTypes.dart';

// @Helpers
import 'package:workshop_twitter/helpers/immutableHelper.dart';

Map initialState() {
  return {
    'lastId': null,
    'tweetCount': 0,
    'isFetching': false,
    'isFetchingNextPage': false,
    'fetchError': false,
    'fetchSuccess': false,
    'tweetData': new List(),
    'filtersState': {
      'verified': false,
      'following': false,
      'defaultProfile': false,
      'links': false,
      'truncated': false
    }
  };
}

List<String> buildActiveFiltersList(Map filtersState) {
  List<String> activeFiltersList = new List<String>();
  filtersState.forEach((key, value) {
    if(value) {
      activeFiltersList.add(key);
    }
  });
  return activeFiltersList;
}

Map mapTimelineData({
  List activeFilters,
  List currentList,
  List newData
}) {
  int lastId = 0;
  if(currentList.length == 0) {
    currentList = new List();
  }
  newData.forEach((tweetData) {
    TimelineTweet tweet = new TimelineTweet(tweetData);
    if(!tweet.shouldFilterTweet(activeFilters)){
      currentList.add(tweet);
      lastId = tweet.id;
    }
  });
  return { 'list': currentList, 'lastId': lastId };
}

Map timelineReducer(Map state, dynamic action) {
  Map nextState = deepCloneMap(state);
  String actionType = action['type'];
  switch(actionType) {
    case TWEETS_TEST_ACTION:
      nextState['tweetCount'] += 1;
      return nextState;
    case TIMELINE_REQUEST_PERFORMED:
      nextState['isFetching'] = true;
      nextState['fetchError'] = false;
      nextState['fetchSuccess'] = false;
      nextState['tweetData'] = new List();
      return nextState;
    case TIMELINE_REQUEST_FAILURE:
      nextState['isFetching'] = false;
      nextState['fetchError'] = true;
      return nextState;
    case TIMELINE_REQUEST_SUCCESS:
      Map timeLineData =  mapTimelineData(
        activeFilters: buildActiveFiltersList(nextState['filtersState']),
        currentList: nextState['tweetData'],
        newData: action['payload']['data']
      );
      nextState['isFetching'] = false;
      nextState['fetchSuccess'] = true;
      nextState['tweetData'] = timeLineData['list'];
      nextState['lastId'] = timeLineData['lastId'];
      return nextState;
    case TIMELINE_REQUEST_NEXT_PAGE_PERFORMED:
      nextState['isFetchingNextPage'] = true;
      return nextState;
    case TIMELINE_REQUEST_NEXT_PAGE_FAILURE:
      nextState['isFetchingNextPage'] = false;
      nextState['fetchError'] = true;
      nextState['fetchSuccess'] = false;
      return nextState;
    case TIMELINE_REQUEST_NEXT_PAGE_SUCCESS:
      Map timeLineData =  mapTimelineData(
        activeFilters: buildActiveFiltersList(nextState['filtersState']),
        currentList: nextState['tweetData'],
        newData: action['payload']['data']
      );
      nextState['isFetchingNextPage'] = false;
      nextState['fetchSuccess'] = true;
      nextState['tweetData'] = timeLineData['list'];
      nextState['lastId'] = timeLineData['lastId'];
      return nextState;
    case TIMELINE_TOGGLE_FILTER:
      String filterId = action['payload']['filterId'];
      nextState['filtersState'][filterId] = !nextState['filtersState'][filterId];
      return nextState;
    default:
      return state;
  }
}