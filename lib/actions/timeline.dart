// @Action types
import 'package:workshop_twitter/constants/actionTypes.dart';

// @Constants
import 'package:workshop_twitter/constants/constants.dart';

// @Helpers
import 'package:workshop_twitter/helpers/apiHelper.dart';
import 'package:workshop_twitter/helpers/actionHelper.dart';

dynamic tweetsIncrement = (store) {
  return () {
    store.dispatch(actionBuilder(
      type: TWEETS_TEST_ACTION
    ));
  };
};

dynamic timelineFetchTweets = (store) {
  return () async {
    String url = buildUrl(endpointKey: 'TIMELINE');
    store.dispatch(actionBuilder(type: TIMELINE_REQUEST_PERFORMED));
    Map response = await apiGet(url);
    if(response['error']) {
      store.dispatch(actionBuilder(
        type: TIMELINE_REQUEST_FAILURE,
        payload: { 'error': response['data'] }
      ));
    } else {
      store.dispatch(actionBuilder(
        type: TIMELINE_REQUEST_SUCCESS,
        payload: { 'data': response['data'] }
      ));
    }
  };
};

dynamic timelineFetchNextPage = (store) {
  return () async {
    if(store.state.timeline['isFetching'] || store.state.timeline['isFetchingNextPage']) {
      return;
    }
    int lastId = store.state.timeline['lastId'];
    String url = buildUrl(endpointKey: 'TIMELINE', query: { 'count': TIMELINE_PAGE_SIZE, 'max_id': lastId });
    store.dispatch(actionBuilder(type: TIMELINE_REQUEST_NEXT_PAGE_PERFORMED));
    Map response = await apiGet(url);
    if(response['error']) {
      store.dispatch(actionBuilder(
        type: TIMELINE_REQUEST_NEXT_PAGE_FAILURE,
        payload: { 'error': response['data'] }
      ));
    } else {
      store.dispatch(actionBuilder(
        type: TIMELINE_REQUEST_NEXT_PAGE_SUCCESS,
        payload: { 'data': response['data'] }
      ));
    }
  };
};