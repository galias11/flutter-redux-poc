Map deepCloneMap(Map dataMap) {
  Map clone = new Map();
  dataMap.forEach((key, value) {
    if(dataMap[key] is Map) {
      clone[key] = deepCloneMap(value);
    }
    else if(dataMap[key] is List) {
      clone[key] = new List();
      value.forEach((element) {
        clone[key].add(element);
      });
    }
    else {
      clone[key] = value;
    }
  });
  return clone;
}