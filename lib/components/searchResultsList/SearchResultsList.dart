// @Vendors
import 'package:flutter/material.dart';

// @Components
import 'package:workshop_twitter/components/tweetTimelineCard/tweetTimelineCard.dart';
import 'package:workshop_twitter/components/loadingSpinner/LoadingSpinner.dart';

// @Helpers
import 'package:workshop_twitter/helpers/actionHelper.dart';

// @Actions
import 'package:workshop_twitter/actions/search.dart' as searchActions;

class SearchResultsList extends StatelessWidget {
  final Map state;
  final Function onPress;

  final ScrollController scrollController = ScrollController(
     initialScrollOffset: 0.0,
     keepScrollOffset: true
  );

  SearchResultsList({
    Key key,
    @required this.state,
    @required this.onPress
  }) : super(key: key) {
    scrollController.addListener(this.onScrollListener);
  }

  void onScrollListener() {
    bool endReached = scrollController.offset == scrollController.position.maxScrollExtent;
    if(endReached) {
      dispatchAction(searchActions.requestNextSearchPage);
    }
  }

  Widget buildPaginationLoader(context, state) {
    if(state['searchIsPaginating']) {
      return Container(
        height: 70,
        child: loadingSpinner()
      );
    }
    return Row();
  }

  Widget buildList(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.all(15.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: state['searchResults'].length,
        itemBuilder: (context, int index) {
          return TimelineCard(
            onPress: onPress,
            tweet: state['searchResults'][index]
          );
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Column(
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            child: SingleChildScrollView(
              controller: scrollController,
              child: buildList(context)
            )
          ),
          buildPaginationLoader(context, state)
        ]
      )
    );
  }
}