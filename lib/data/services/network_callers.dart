import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:http/http.dart';

import 'package:e_commerce_app/data/services/network_response.dart';

class NetworkCallers {
  var logger = Logger();

  static Future<NetworkResponse> getRequest(String url, {String? token}) async {
    try {
      Response response = await get(
          Uri.parse(
            url,
          ),
          headers: {'content-type': 'application/json', 'token': token ?? ""});

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccessful: true,
            responseData: jsonDecode(response.body));
      } else {
        return NetworkResponse(
            statusCode: response.statusCode, isSuccessful: false);
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccessful: false,
        errorMessage: "Something Went Wrong! Try Again",
      );
    }
  }

  static Future<NetworkResponse> postRequest(
      String url, String token, Map<String, dynamic> body) async {
    try {
      Response response =
          await post(Uri.parse(url), headers: {'token': token}, body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccessful: true,
            responseData: jsonDecode(response.body));
      } else {
        return NetworkResponse(
            statusCode: response.statusCode, isSuccessful: false);
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccessful: false,
        errorMessage: "Something Went Wrong! Try Again",
      );
    }
  }
}
