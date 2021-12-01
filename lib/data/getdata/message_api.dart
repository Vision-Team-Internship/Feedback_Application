// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:feedback_application_flutter/data/getdata/api_repository.dart';
import 'package:feedback_application_flutter/model/approve_history_model.dart';
import 'package:feedback_application_flutter/model/approved_model.dart';
import 'package:feedback_application_flutter/model/completed_model.dart';
import 'package:feedback_application_flutter/model/detail_inprocess_model.dart';
import 'package:feedback_application_flutter/model/detail_message_model.dart';
import 'package:feedback_application_flutter/model/message_model.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MessageApi extends ApiRepository {
  Future<FeedbackModel> readDataFromMessage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("login");
    http.Response response = await http.get(
      Uri.parse(
        '$baseUrl/feedbacks',
      ),
      headers:{
        "auth-token": '$token',
        "Content-Type": "application/json"
      },
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
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("login");
    http.Response response = await http.get(
      Uri.parse(
        '$baseUrl/feedbacks/$id',
      ),
      headers: <String, String>{
        "auth-token": '$token',
        "Content-Type": "application/json"
      },
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
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("login");

    http.Response response = await http.get(
        Uri.parse(
          '$baseUrl/feedbacks/$id',
        ),
        headers: <String, String>{
          "auth-token": '$token',
          "Content-Type": "application/json"
        });
    if (response.statusCode == 200) {
      return DetailInprocessModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Error while reading data");
    }
  }

  Future<ApprovedModel> readDetailApprove(id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("login");
    http.Response response = await http.get(
        Uri.parse(
          '$baseUrl/approveds/?feedback_id=$id',
        ),
        headers: <String, String>{
          "auth-token": '$token',
          "Content-Type": "application/json"
        });
    if (response.statusCode == 200) {
      return ApprovedModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Error while reading data");
    }
  }

  Future<CompletedModel> completedHistory(id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("login");
    http.Response response = await http.get(
        Uri.parse(
          '$baseUrl/completeds/?feedback_id=$id',
        ),
        headers: <String, String>{
          "auth-token": '$token',
          "Content-Type": "application/json"
        });
    if (response.statusCode == 200) {
      return CompletedModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Error while reading data");
    }
  }

  Future<FeedbackModel> readDetailHistory(id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("login");
    http.Response response = await http.get(
        Uri.parse(
          '$baseUrl/approveds/?feedback_id=$id',
        ),
        headers: <String, String>{
          "auth-token": '$token',
          "Content-Type": "application/json"
        });
    if (response.statusCode == 200) {
      return FeedbackModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Error while reading data");
    }
  }

  Future<HistoryApprove> historyApp(id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("login");
    http.Response response = await http.get(
        Uri.parse(
          '$baseUrl/feedbacks',
        ),
        headers: <String, String>{
          "auth-token": '$token',
          "Content-Type": "application/json"
        });
    if (response.statusCode == 200) {
      return HistoryApprove.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Error while reading data");
    }
  }
}
