Map actionBuilder({
  String type,
  Map payload
}) =>  new Map.from({
  'type': type,
  'payload': payload
});

void dispatchAction(dynamic action, dynamic store) {
  action(store)();
}