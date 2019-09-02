// @Action types
import 'package:workshop_twitter/constants/actionTypes.dart';

// @Constants
import 'package:workshop_twitter/constants/constants.dart';

// @Helpers
import 'package:workshop_twitter/helpers/apiHelper.dart';
import 'package:workshop_twitter/helpers/actionHelper.dart';

dynamic setSearchValue = (store, {Map args}) => () async {
  String searchValue = args['value'];
  store.dispatch(actionBuilder(type: SEARCH_SET_VALUE, payload: {'value': searchValue}));
};

dynamic resetSearch = (store) => () async {
  store.dispatch(actionBuilder(type: SEARCH_RESET));
};

dynamic requestSearch = (store) => () async {
  String searchValue = store.state.search['searchValue'];
  String url = buildUrl(endpointKey: 'SEARCH', query: {'q': searchValue, 'count': TIMELINE_PAGE_SIZE});
  if(searchValue == '') {
    return;
  }
  store.dispatch(actionBuilder(type: SEARCH_REQUEST_PERFORMED));
  Map response = await apiGet(url);
  if(response['error']) {
    store.dispatch(actionBuilder(
      type: SEARCH_REQUEST_FAILURE,
      payload: { 'error': response['data'] }
    ));
  } else {
    store.dispatch(actionBuilder(
      type: SEARCH_REQUEST_SUCCESS,
      payload: { 'data': response['data']['statuses'] }
    ));
  }
};

dynamic requestNextSearchPage = (store) {
  return () async {
    if(store.state.search['isFetching'] || store.state.search['isPaginating']) {
      return;
    }
    String searchValue = store.state.search['lastSearchValue'];
    int lastId = store.state.search['lastSearchId'];
    String url = buildUrl(endpointKey: 'SEARCH', query: {'q': searchValue, 'count': TIMELINE_PAGE_SIZE, 'max_id': lastId });
    store.dispatch(actionBuilder(type: SEARCH_NEXT_PAGE_REQUEST_PERFORMED));
    Map response = await apiGet(url);
    if(response['error']) {
      store.dispatch(actionBuilder(
        type: SEARCH_NEXT_PAGE_REQUEST_FAILURE,
        payload: { 'error': response['data'] }
      ));
    } else {
      store.dispatch(actionBuilder(
        type: SEARCH_NEXT_PAGE_REQUEST_SUCCESS,
        payload: { 'data': response['data']['statuses'] }
      ));
    }
  };
};