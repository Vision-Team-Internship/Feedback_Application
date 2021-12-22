import 'dart:convert';

import 'package:feedback_application_flutter/data/getdata/api_repository.dart';
import 'package:feedback_application_flutter/model/mark_as_read_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MarkAsReadApi extends ApiRepository{
    Future<MarkAsReadModel> markAsRead() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("login");
    http.Response response = await http.get(
      Uri.parse(
        'https://feedback-project-api.herokuapp.com/api/v1/feedback/notifications/markallasread',
      ),
      headers:{
        "auth-token": '$token',
        "Content-Type": "application/json"
      },
    );
    if (response.statusCode == 200) {
    
      return MarkAsReadModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Error while reading data");
    }
  }
}