// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:feedback_application_flutter/data/api_repository.dart';
import 'package:feedback_application_flutter/model/message_model.dart';
import 'package:http/http.dart' as http;

class MessageApi extends ApiRepository {
  Future<FeedbackModel> readDataFromMessage() async {
    http.Response response = await http.get(
      Uri.parse(
        '$baseUrl/feedbacks',
      ),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return FeedbackModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Error while reading data");
    }
  }

  Future<FeedbackModel> readFloorbyID(id) async {
    http.Response response = await http.get(
      Uri.parse(
        '$baseUrl/feedbacks/$id',
      ),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return FeedbackModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Error while reading data");
    }
  }

}
