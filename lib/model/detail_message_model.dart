// To parse this JSON data, do
//
//     final detailMessageModel = detailMessageModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DetailMessageModel detailMessageModelFromJson(String str) => DetailMessageModel.fromJson(json.decode(str));

String detailMessageModelToJson(DetailMessageModel data) => json.encode(data.toJson());

class DetailMessageModel {
    DetailMessageModel({
        required this.message,
        required this.payload,
    });

    String message;
    Payload payload;

    factory DetailMessageModel.fromJson(Map<String, dynamic> json) => DetailMessageModel(
        message: json["message"],
        payload: Payload.fromJson(json["payload"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "payload": payload.toJson(),
    };
}

class Payload {
    Payload({
        required this.id,
        required this.title,
        required this.message,
        required this.feedbackLevel,
        required this.createdDate,
        required this.isApproved,
        required this.isRejected,
        required this.isCompleted,
        required this.feedbackType,
        required this.uniqueIDs,
        required this.feedbackLocation,
        required this.v,
    });

    String id;
    String title;
    String message;
    String feedbackLevel;
    DateTime createdDate;
    bool isApproved;
    bool isRejected;
    bool isCompleted;
    String feedbackType;
    List<String> uniqueIDs;
    String feedbackLocation;
    int v;

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["_id"],
        title: json["title"],
        message: json["message"],
        feedbackLevel: json["feedbackLevel"],
        createdDate: DateTime.parse(json["createdDate"]),
        isApproved: json["isApproved"],
        isRejected: json["isRejected"],
        isCompleted: json["isCompleted"],
        feedbackType: json["feedbackType"],
        uniqueIDs: List<String>.from(json["uniqueIDs"].map((x) => x)),
        feedbackLocation: json["feedbackLocation"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "message": message,
        "feedbackLevel": feedbackLevel,
        "createdDate": createdDate.toIso8601String(),
        "isApproved": isApproved,
        "isRejected": isRejected,
        "isCompleted": isCompleted,
        "feedbackType": feedbackType,
        "uniqueIDs": List<dynamic>.from(uniqueIDs.map((x) => x)),
        "feedbackLocation": feedbackLocation,
        "__v": v,
    };
}
