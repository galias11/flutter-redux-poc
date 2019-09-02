// @Model
import 'package:workshop_twitter/model/TimelineTweet.dart';

// @Action types
import 'package:workshop_twitter/constants/actionTypes.dart';

// @Helpers
import 'package:workshop_twitter/helpers/immutableHelper.dart';

Map initialState() {
  return {
    'lastSearchId': 0,
    'lastSearchValue': '',
    'searchValue': '',
    'searchPerformed': false,
    'isFetching': false,
    'isPaginating': false,
    'fetchError': false,
    'fetchSuccess': false,
    'tweetsData': new List()
  };
}

Map mapTimelineData({
  List currentList,
  List newData
}) {
  int lastId = 0;
  if(currentList.length == 0) {
    currentList = new List();
  }
  newData.forEach((tweetData) {
    TimelineTweet tweet = new TimelineTweet(tweetData);
    currentList.add(tweet);
    lastId = tweet.id;
  });
  return { 'list': currentList, 'lastId': lastId };
}

Map searchReducer(Map state, dynamic action) {
  Map nextState = deepCloneMap(state);
  String actionType = action['type'];
  switch(actionType) {
    case SEARCH_SET_VALUE:
      nextState['searchValue'] = action['payload']['value'];
      return nextState;
    case SEARCH_REQUEST_PERFORMED:
      nextState['isFetching'] = true;
      nextState['fetchError'] = false;
      nextState['fetchSuccess'] = false;
      nextState['searchPerformed'] = true;
      nextState['tweetsData'] = new List<TimelineTweet>();
      return nextState;
    case SEARCH_REQUEST_FAILURE:
      nextState['isFetching'] = false;
      nextState['fetchError'] = true;
      return nextState;
    case SEARCH_REQUEST_SUCCESS:
      Map searchListData = mapTimelineData(
        currentList: nextState['tweetsData'],
        newData:action['payload']['data']
      );
      nextState['isFetching'] = false;
      nextState['fetchSuccess'] = true;
      nextState['tweetsData'] = searchListData['list'];
      nextState['lastSearchId'] = searchListData['lastId'];
      nextState['lastSearchValue'] = nextState['searchValue'];
      return nextState;
    case SEARCH_NEXT_PAGE_REQUEST_PERFORMED:
      nextState['isPaginating'] = true;
      nextState['fetchError'] = false;
      nextState['fetchSuccess'] = true;
      return nextState;
    case SEARCH_NEXT_PAGE_REQUEST_FAILURE:
      nextState['isPaginating'] = false;
      nextState['fetchError'] = true;
      return nextState;
    case SEARCH_NEXT_PAGE_REQUEST_SUCCESS:
      Map searchListData = mapTimelineData(
        currentList: nextState['tweetsData'],
        newData:action['payload']['data']
      );
      nextState['isPaginating'] = false;
      nextState['fetchSuccess'] = true;
      nextState['lastSearchId'] = searchListData['lastId'];
      nextState['lastSearchValue'] = nextState['searchValue'];
      return nextState;
    case SEARCH_RESET:
      String previousSearchValue = nextState['searchValue'];
      nextState = initialState();
      nextState['searchValue'] = previousSearchValue;
      return nextState;
    default:
      return state;
  }
}