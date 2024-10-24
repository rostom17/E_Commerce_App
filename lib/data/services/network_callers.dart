import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:http/http.dart';

import 'package:e_commerce_app/data/models/network_response.dart';

class NetworkCallers {
  var logger = Logger();

  static Future<NetworkResponse> getRequest(String url) async {
    try {
      Response response = await get(Uri.parse(url,),headers: {'content-type' : 'application/json', 'token' : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsYXJhdmVsLXRva2VuIiwiaWF0IjoxNzI3MzI1NzYyLCJleHAiOjE3MjczMjkzNjIsInVzZXJFbWFpbCI6Im1ycmFiYmlsaGFzYW5AZ21haWwuY29tIiwidXNlcklEIjoyNjZ9.FFuk0PHMqiQpExdI2ijUGEkP1ZvfthhsCbj29R7G4T8"});
      //print("\n\n\n ${response.statusCode} \n\n\n");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccessful: true,
            responseData: jsonDecode(response.body));
      }
      else {
        return NetworkResponse(statusCode: response.statusCode, isSuccessful: false);
      }
    } catch (e) {
      return NetworkResponse(statusCode: -1, isSuccessful: false, errorMessage: "Something Went Wrong! Try Again");
    }
  }
}
