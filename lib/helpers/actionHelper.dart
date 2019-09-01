// @Reducers
import 'package:workshop_twitter/reducers/index.dart';

Map actionBuilder({
  String type,
  Map payload
}) =>  new Map.from({
  'type': type,
  'payload': payload
});

void dispatchAction(dynamic action, {Map args}) {
  if(args == null) {
    action(tweetsStore)();
    return;
  }
  action(tweetsStore, args: args)();
}