// @Model
import 'package:workshop_twitter/model/Trend.dart';

// @Action types
import 'package:workshop_twitter/constants/actionTypes.dart';

// @Helpers
import 'package:workshop_twitter/helpers/immutableHelper.dart';

Map initialState() {
  return {
    'isFetching': false,
    'fetchError': false,
    'fetchSuccess': false,
    'trendsData': new List()
  };
}

List<Trend> parseTrendsData(List trendsData) {
  List<Trend> trendsList = new List<Trend>();
  trendsData.forEach((trend) {
    trendsList.add(new Trend(trend));
  });
  return trendsList;
}

Map trendsReducer(Map state, dynamic action) {
  Map nextState = deepCloneMap(state);
  String actionType = action['type'];
  switch(actionType) {
    case TRENDS_REQUEST_PERFORMED:
      nextState['isFetching'] = true;
      nextState['fetchError'] = false;
      nextState['fetchSuccess'] = false;
      nextState['trendsData'] = new List();
      return nextState;
    case TRENDS_REQUEST_FAILURE:
      nextState['isFetching'] = false;
      nextState['fetchError'] = true;
      return nextState;
    case TRENDS_REQUEST_SUCCESS:
      nextState['isFetching'] = false;
      nextState['fetchSuccess'] = true;
      nextState['trendsData'] = parseTrendsData(action['payload']['data']);
      return nextState;
    default:
      return state;
  }
}