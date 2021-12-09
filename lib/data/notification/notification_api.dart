import 'dart:convert';

import 'package:feedback_application_flutter/data/getdata/api_repository.dart';
import 'package:feedback_application_flutter/model/notification_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class NotificationApi extends ApiRepository{
  Future<NotificationModel> readDataFromNotification() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("login");
     http.Response response = await http.get(
      Uri.parse(
        '$baseUrl/feedback/notifications',
      ),
      headers:{
        "auth-token": '$token',
        "Content-Type": "application/json"
      },
    );
    if (response.statusCode == 200) {
    
      return NotificationModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Error while reading data");
    }

  }
}