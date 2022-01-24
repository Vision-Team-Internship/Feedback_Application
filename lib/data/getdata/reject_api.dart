import 'dart:convert';

import 'package:feedback_application_flutter/data/getdata/api_repository.dart';
import 'package:feedback_application_flutter/model/detail_message_model.dart';
import 'package:feedback_application_flutter/model/detail_reject_model.dart';
import 'package:feedback_application_flutter/model/rejected_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RejectRepository extends ApiRepository {
  Future<DetailMessageModel> readRejectMessage(id) async {
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
      return DetailMessageModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Error while reading data");
    }
  }

  Future<RejectModel> readRejectHistory(id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("login");
    http.Response response = await http.get(
        Uri.parse(
          '$baseUrl/rejecteds/?feedback_id=$id',
        ),
        headers: <String, String>{
          "auth-token": '$token',
          "Content-Type": "application/json"
        });
    if (response.statusCode == 200) {
      return RejectModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Error while reading data");
    }
  }


  Future<DetailRejectModel> readRejectDetail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("login");
    http.Response response = await http.get(
        Uri.parse(
          'https://feedback-project-api.herokuapp.com/api/v1/rejecteds',
        ),
        headers: <String, String>{
          "auth-token": '$token',
          "Content-Type": "application/json"
        });
    if (response.statusCode == 200) {
      return DetailRejectModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Error while reading data");
    }
  }

}
