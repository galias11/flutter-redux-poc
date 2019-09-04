// @Vendors
import 'package:intl/intl.dart';

// @Constants
import 'package:workshop_twitter/constants/constants.dart';

DateFormat format = new DateFormat(TWEET_DEFAULT_DATE_FORMAT);

class TimelineTweet {
  int _id;
  String _strId;
  String _avatarSource;
  String _publisherName;
  String _publisherSource;
  DateTime _creationTime;
  String _tweetBody;
  String _imageSource;
  int _favCounter;
  int _retweetCounter;
  Map<String, bool> _filteringParams;

  int get id => this._id;
  String get strId => this._strId;
  String get avatarSource => this._avatarSource;
  String get publisherName => this._publisherName;
  String get publisherSource => this._publisherSource;
  DateTime get creationTime => this._creationTime;
  String get tweetBody => this._tweetBody;
  String get imageSource => this._imageSource;
  int get favCounter => this._favCounter;
  int get retweetCounter => this._retweetCounter;
  Map<String, bool> get filteringParamss => this._filteringParams;

  TimelineTweet(tweetData) {
    final String publisherName = tweetData['user']['screen_name'];
    final List media = tweetData['entities']['media'];
    this._id = int.parse(tweetData['id_str']) - 1;
    this._strId = tweetData['id_str'];
    this._avatarSource = tweetData['user']['profile_image_url'];
    this._publisherName = publisherName;
    this._publisherSource = '@$publisherName';
    this._creationTime = format.parse(tweetData['created_at'].replaceAll(TWEET_DATE_REPLACEMENT, '')).subtract(Duration(hours: 3));
    this._tweetBody = tweetData['text'];
    this._imageSource = media != null ? media[0]['media_url'] : null;
    this._favCounter = tweetData['favorite_count'];
    this._retweetCounter = tweetData['retweet_count'];
    this._filteringParams = {
      'verified': tweetData['user']['verified'],
      'following': tweetData['user']['following'],
      'defaultProfile': tweetData['user']['default_profile'],
      'links': tweetData['entities']['urls'] != null && tweetData['entities']['urls'].length > 0,
      'truncated': tweetData['truncated']
    };
  }

  bool shouldFilterTweet(List<String> activeFilters) {
    bool shouldFilter = false;
    activeFilters.forEach((filter) {
      if(this._filteringParams[filter]) {
        shouldFilter = true;
        return;
      }
    });
    return shouldFilter;
  }
}