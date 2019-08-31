// @Vendors
import 'dart:convert';
import 'package:http/http.dart' as http;

// @Endpoints cfg
import 'package:workshop_twitter/config/endpoints.dart';

const String QUERY_BASE_CHAR = '?';
const String QUERY_CAT_STRING = '&';

String buildQuery(Map query) {
  String queryString = '';
  bool isFirst = true;
  if(query == null || query.isEmpty) {
    return queryString;
  }
  query.forEach((key, value) {
    queryString += (isFirst ? QUERY_BASE_CHAR : QUERY_CAT_STRING) + '$key=$value';
    isFirst = false;
  });
  return queryString;
}

String replaceParams(String baseUrl, Map params) {
  if(params == null || params.isEmpty) {
    return baseUrl;
  }
  params.forEach((key, value) {
    baseUrl.replaceFirst(key, value);
  });
  return baseUrl;
}

String buildUrl({String endpointKey, Map query, Map params}) {
  String baseHost = BASE_HOST;
  String endpoint = ENDPOINTS[endpointKey];
  String queryString = buildQuery(query);
  String url = '$baseHost$endpoint$queryString';
  replaceParams(url, params);
  return url;
}

Future<Map> apiGet(String url) async {
  var httpClient = http.Client();
  try {
    var response = await httpClient.get(url);
    return {
      'error': !(response.statusCode >= 200 && response.statusCode < 300),
      'data': jsonDecode(response.body)
    };
  }
  catch(err) {
    return {
      'error': true,
      'data': err
    };
  }
  finally {
    httpClient.close();
  }
}