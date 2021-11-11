// To parse this JSON data, do
//
//     final feedbackModel = feedbackModelFromJson(jsonString);

import 'dart:convert';

FeedbackModel feedbackModelFromJson(String str) => FeedbackModel.fromJson(json.decode(str));

String feedbackModelToJson(FeedbackModel data) => json.encode(data.toJson());

class FeedbackModel {
    FeedbackModel({
        this.message,
        this.payload,
    });

    String? message;
    List<Payload>? payload;

    factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
        message: json["message"],
        payload: List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "payload": List<dynamic>.from(payload!.map((x) => x.toJson())),
    };
}

class Payload {
    Payload({
        this.id,
        this.title,
        this.message,
        this.feedbackLevel,
        this.createdDate,
        this.isApproved,
        this.isRejected,
        this.isCompleted,
        this.feedbackType,
        this.uniqueIDs,
        this.v,
    });

    String? id;
    String? title;
    String? message;
    String? feedbackLevel;
    DateTime? createdDate;
    bool? isApproved;
    bool? isRejected;
    bool? isCompleted;
    String? feedbackType;
    List<String>? uniqueIDs;
    int? v;

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
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "message": message,
        "feedbackLevel": feedbackLevel,
        "createdDate": createdDate!.toIso8601String(),
        "isApproved": isApproved,
        "isRejected": isRejected,
        "isCompleted": isCompleted,
        "feedbackType": feedbackType,
        "uniqueIDs": List<dynamic>.from(uniqueIDs!.map((x) => x)),
        "__v": v,
    };
}
