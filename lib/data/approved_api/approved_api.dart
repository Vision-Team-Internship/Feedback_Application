import 'dart:convert';
import 'package:feedback_application_flutter/data/getdata/api_repository.dart';
import 'package:feedback_application_flutter/model/approved_model.dart';

import 'package:feedback_application_flutter/model/detail_approve_history_model.dart';
import 'package:feedback_application_flutter/model/message_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApprovedApi extends ApiRepository {
  Future<DetailApproveHistory> readApproveDetail(id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("login");
    http.Response response = await http.get(
        Uri.parse("$baseUrl/approveds?feedback_id=$id"),
        headers: <String, String>{
          "auth-token": '$token',
          "Content-Type": "application/json"
        });
    if (response.statusCode == 200) {
      return DetailApproveHistory.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error while reading data in Approve");
    }
  }

  Future<FeedbackModel> updateApprove(id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("login");
    http.Response response = await http.put(
      Uri.parse(
        "$baseUrl/approveds/$id",
      ),
      headers: <String, String>{
        "auth-token": '$token',
        "Content-Type": "application/json"
      },
      body: jsonEncode(<String, String>{
        'isApproved': id,
      }),
    );

    if (response.statusCode == 200) {
      
      return FeedbackModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update approved');
    }
  }

  //Make approved Message
  Future<ApprovedModel> makeApprove(note, id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("login");
    http.Response response = await http.post(
      Uri.parse(
        '$baseUrl/approveds',
      ),
      headers: <String, String>{
        "auth-token": '$token',
        "Content-Type": "application/json"
      },
      body: jsonEncode(
        {
          'note': note,
          'feedback_id': id,
        },
      ),
    );

    if (response.statusCode == 201) {
      return ApprovedModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create ablum");
    }
  }
}
