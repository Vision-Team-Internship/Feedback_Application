// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:feedback_application_flutter/data/getdata/api_repository.dart';
import 'package:feedback_application_flutter/model/message_model.dart';
import 'package:http/http.dart' as http;

class DeleteMessage extends ApiRepository {
  Future<FeedbackModel> deleteHistoryMessage(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('$baseUrl/feedbacks/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print("Delete Successfully");
      return FeedbackModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete message.');
    }
  }
}
