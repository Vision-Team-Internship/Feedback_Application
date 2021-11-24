import 'dart:convert';

import 'package:feedback_application_flutter/data/getdata/api_repository.dart';
import 'package:feedback_application_flutter/model/detail_message_model.dart';
import 'package:feedback_application_flutter/model/rejected_model.dart';
import 'package:http/http.dart' as http;

class RejectRepository extends ApiRepository {
   Future<DetailMessageModel> readRejectMessage(id) async {
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

    Future<RejectModel> readRejectHistory(id) async {
    http.Response response = await http.get(
      Uri.parse(
        '$baseUrl/rejecteds/?feedback_id=$id',
      ),
    );
    if (response.statusCode == 200) {
      return RejectModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Error while reading data");
    }
  }
}
