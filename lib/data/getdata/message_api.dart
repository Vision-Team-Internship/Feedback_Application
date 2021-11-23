// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:feedback_application_flutter/data/getdata/api_repository.dart';
import 'package:feedback_application_flutter/model/approved_model.dart';
import 'package:feedback_application_flutter/model/detail_inprocess_model.dart';
import 'package:feedback_application_flutter/model/detail_message_model.dart';
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
      return FeedbackModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Error while reading data");
    }
  }

  Future<DetailMessageModel> readDetailMessage(id) async {
    http.Response response = await http.get(
      Uri.parse(
        '$baseUrl/feedbacks/$id',
      ),
    );
    if (response.statusCode == 200) {
      return DetailMessageModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Error while reading data");
    }
  }

  Future<DetailInprocessModel> readDetailInprocess(id) async {
     http.Response response = await http.get(
      Uri.parse(
        '$baseUrl/feedbacks/$id',
      ),
    );
     if (response.statusCode == 200) {
      return DetailInprocessModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Error while reading data");
    }
  }

Future<ApprovedModel> readDetailApprove(id)async{
  http.Response response = await http.get(
      Uri.parse(
        '$baseUrl/approveds/?feedback_id=$id',
      ),
    );
     if (response.statusCode == 200) {
      return ApprovedModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Error while reading data");
    }
}
}
