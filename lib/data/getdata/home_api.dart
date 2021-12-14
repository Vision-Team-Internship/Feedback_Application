import 'dart:async';
import 'dart:convert';
import 'package:feedback_application_flutter/data/getdata/api_repository.dart';
import 'package:feedback_application_flutter/model/count_inprocessing_model.dart';
import 'package:feedback_application_flutter/model/home_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeApi extends ApiRepository {
  Future<HomeModel> readCountMessage(String url) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("login");
    http.Response response = await http.get(
      Uri.parse(
        '$baseUrl/feedbacks/$url',
      ),
      headers: {
        "auth-token": '$token',
        "Content-Type": "application/json",
      },
    ).timeout(const Duration(seconds: 60),
        onTimeout: () => throw TimeoutException(
            'The connection has timed out, Please try again!'));
    if (response.statusCode == 200) {
      return HomeModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Error while reading data");
    }
  }

  Future<CountInprocessingModel> readCountInprocessing(String url) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("login");
    http.Response response = await http.get(
      Uri.parse(
        '$baseUrl/feedbacks/$url',
      ),
      headers: {
        "auth-token": '$token',
        "Content-Type": "application/json",
      },
    ).timeout(const Duration(seconds: 60),
        onTimeout: () => throw TimeoutException(
            'The connection has timed out, Please try again!'));
    if (response.statusCode == 200) {
      return CountInprocessingModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Error while reading data");
    }
  }
}
