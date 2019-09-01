class Trend {
  String _name;
  int _tweetCount;

  String get name => this._name;
  int get tweetCount => this._tweetCount;

  Trend(Map trendData) {
    this._name = trendData['name'];
    this._tweetCount = trendData['tweet_volume'];
  }
}