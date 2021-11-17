import 'dart:convert';

import 'package:feedback_application_flutter/data/getdata/api_repository.dart';
import 'package:feedback_application_flutter/model/detail_approve_history_model.dart';
import 'package:http/http.dart' as http;

class ApprovedApi extends ApiRepository {
  Future<DetailApproveModel> readApproveDetail(id) async {
    http.Response response =
        await http.get(Uri.parse("$baseUrl/approveds?feedback_id=$id"));
    if (response.statusCode == 200) {
      return DetailApproveModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error while reading data in Approve");
    }
  }
}
