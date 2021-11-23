// To parse this JSON data, do
//
//     final completedModel = completedModelFromJson(jsonString);

import 'dart:convert';

CompletedModel completedModelFromJson(String str) => CompletedModel.fromJson(json.decode(str));

String completedModelToJson(CompletedModel data) => json.encode(data.toJson());

class CompletedModel {
    CompletedModel({
        this.message,
        this.payload,
    });

    String? message;
    List<Payload>? payload;

    factory CompletedModel.fromJson(Map<String, dynamic> json) => CompletedModel(
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
        this.note,
        this.createdDate,
        this.feedbackId,
        this.v,
    });

    String? id;
    String? note;
    DateTime? createdDate;
    String? feedbackId;
    int? v;

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["_id"],
        note: json["note"],
        createdDate: DateTime.parse(json["createdDate"]),
        feedbackId: json["feedback_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "note": note,
        "createdDate": createdDate!.toIso8601String(),
        "feedback_id": feedbackId,
        "__v": v,
    };
}
