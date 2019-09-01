// @Action types
import 'package:workshop_twitter/constants/actionTypes.dart';

// @Helpers
import 'package:workshop_twitter/helpers/apiHelper.dart';
import 'package:workshop_twitter/helpers/actionHelper.dart';

dynamic selecteTweet = (store, {Map args}) {
  return () {
    store.dispatch(actionBuilder(
      type: TWEET_DETAILS_SELECT_TWEET,
      payload: {'tweetId': args['tweetId']}
    ));
  };
};

dynamic tweetDetaisFetch = (store) {
  return () async {
    String tweetId = store.state.tweetDetails['selectedId'].toString();
    String url = buildUrl(endpointKey: 'TWEET_DETAILS', query: {'id': tweetId});
    store.dispatch(actionBuilder(type: TWEET_DETAILS_REQUEST_PERFORMED));
    Map response = await apiGet(url);
    if(response['error']) {
      store.dispatch(actionBuilder(
        type: TWEET_DETAILS_REQUEST_FAILURE,
        payload: { 'error': response['data'] }
      ));
    } else {
      store.dispatch(actionBuilder(
        type: TWEET_DETAILS_REQUEST_SUCCESS,
        payload: { 'data': response['data'] }
      ));
    }
  };
};