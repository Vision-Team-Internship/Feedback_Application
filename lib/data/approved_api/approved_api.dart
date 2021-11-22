import 'dart:convert';
import 'package:feedback_application_flutter/data/getdata/api_repository.dart';
import 'package:feedback_application_flutter/model/approved_model.dart';

import 'package:feedback_application_flutter/model/detail_approve_history_model.dart';
import 'package:feedback_application_flutter/model/message_model.dart';
import 'package:http/http.dart' as http;

class ApprovedApi extends ApiRepository {
  Future<DetailApproveModel> readApproveDetail(id) async {
    http.Response response = await http.get(
      Uri.parse("$baseUrl/approveds?feedback_id=$id"),
    );
    if (response.statusCode == 200) {
      return DetailApproveModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error while reading data in Approve");
    }
  }

  Future<FeedbackModel> updateApprove(id) async {
    http.Response response = await http.put(
      Uri.parse(
        "$baseUrl/approveds/$id",
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
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
    http.Response response = await http.post(
      Uri.parse(
        '$baseUrl/approveds',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
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
