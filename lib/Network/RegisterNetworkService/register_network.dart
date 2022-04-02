
import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

import '../../Constants/Strings/app_string.dart';

class RegisterNetwork{
  var logger = Logger();

  Future logIn(Map<String, String> data)async {
    try{
      var response = await http.post(
        Uri.parse(BASE_URL + "users/login"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json"
        },
        body: json.encode(data),
      );
      logger.d(response.body);
      return jsonDecode(response.body);
    }catch(e){
      print(e);
      return null;
    }
  }
}