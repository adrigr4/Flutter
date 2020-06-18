import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jomel/apiCalls/exceptions.dart';
import 'dart:async';

  const _baseUrl = 'https://192.168.1.32:44358/api/';

  Map<String,String> headers = {
  'Content-type' : 'application/json', 
  'Accept': 'application/json',
  };
  
class ApiBaseHelper {
  
Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(_baseUrl + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
}

Future<dynamic> post(String url, Map<String, String> body) async {
    var responseJson;
    try {
      print(json.encode(body));
      final response = await http.post(_baseUrl + url, headers: headers, body: json.encode(body));
      print(response);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      print(responseJson);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
  
}
}
  