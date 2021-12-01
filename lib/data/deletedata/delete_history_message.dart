// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:feedback_application_flutter/data/getdata/api_repository.dart';
import 'package:feedback_application_flutter/model/message_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DeleteMessage extends ApiRepository {
  Future<FeedbackModel> deleteHistoryMessage(String id) async {
     SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("login");
    final http.Response response = await http.delete(
      Uri.parse('$baseUrl/feedbacks/$id'),
        headers: <String, String>{
          "auth-token": '$token',
          "Content-Type": "application/json"
        }
    );

    if (response.statusCode == 200) {
      print("Delete Successfully");
      return FeedbackModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete message.');
    }
  }
}
