import 'dart:convert';

import 'package:feedback_application_flutter/data/getdata/api_repository.dart';
import 'package:feedback_application_flutter/model/archived_message_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ArchivedMessageApi extends ApiRepository {

  //Show List Archieved
  Future<ArchivedMessageModel> readArchived() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("login");
    http.Response response = await http.get(
      Uri.parse("$baseUrl/feedbacks/?isArchived=true"),
      headers: <String, String>{
        "auth-token": '$token',
        "Content-Type": "application/json"
      },
    );
    if (response.statusCode == 200) {
      return ArchivedMessageModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fail read data from api archived message");
    }
  }

  // Archived Message
  Future<ArchivedMessageModel> makeArchivedApi(String? id)async{
     SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("login");
    http.Response response = await http.get(
      Uri.parse("https://feedback-project-api.herokuapp.com/api/v1/archive/$id"),
      headers: <String, String>{
        "auth-token": '$token',
        "Content-Type": "application/json"
      },
    );
    if (response.statusCode == 200) {
      return ArchivedMessageModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fail read data from api archived message");
    }
  }
}
