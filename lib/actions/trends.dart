// @Constants
import 'package:workshop_twitter/constants/constants.dart';

// @Action types
import 'package:workshop_twitter/constants/actionTypes.dart';

// @Helpers
import 'package:workshop_twitter/helpers/apiHelper.dart';
import 'package:workshop_twitter/helpers/actionHelper.dart';

dynamic trendsFetch = (store) {
  return () async {
    String url = buildUrl(endpointKey: 'TRENDS', query: {'id': WOEID });
    store.dispatch(actionBuilder(type: TRENDS_REQUEST_PERFORMED));
    Map response = await apiGet(url);
    if(response['error']) {
      store.dispatch(actionBuilder(
        type: TRENDS_REQUEST_FAILURE,
        payload: { 'error': response['data'] }
      ));
    } else {
      store.dispatch(actionBuilder(
        type: TRENDS_REQUEST_SUCCESS,
        payload: { 'data': response['data'][0]['trends'] }
      ));
    }
  };
};