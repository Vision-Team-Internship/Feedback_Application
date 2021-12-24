// To parse this JSON data, do
//
//     final archivedMessageModel = archivedMessageModelFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators

import 'dart:convert';

ArchivedMessageModel archivedMessageModelFromJson(String str) =>
    ArchivedMessageModel.fromJson(json.decode(str));

String archivedMessageModelToJson(ArchivedMessageModel data) =>
    json.encode(data.toJson());

class ArchivedMessageModel {
  ArchivedMessageModel({
    this.message,
    this.count,
    this.payload,
  });

  String? message;
  int? count;
  List<Payload>? payload;

  factory ArchivedMessageModel.fromJson(Map<String, dynamic> json) =>
      ArchivedMessageModel(
        message: json["message"],
        count: json["count"],
        payload:
            List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "count": count,
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
    this.isArchived,
    this.isApproved,
    this.isRejected,
    this.isCompleted,
    this.feedbackType,
    this.uniqueIDs,
    this.url,
    this.cloudinaryId,
    this.v,
    this.approvedDate,
    this.archivedDate,
  });
  String? id;
  String? title;
  String? message;
  String? feedbackLevel;
  DateTime? createdDate;
  bool? isArchived;
  bool? isApproved;
  bool? isRejected;
  bool? isCompleted;
  String? feedbackType;
  List<String>? uniqueIDs;

  String? url;
  String? cloudinaryId;
  int? v;
  DateTime? approvedDate;
  DateTime? archivedDate;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
      
        id: json["_id"],
        title: json["title"],
        message: json["message"],
        feedbackLevel: json["feedbackLevel"],
        createdDate: DateTime.parse(json["createdDate"]),
        isArchived: json["isArchived"],
        isApproved: json["isApproved"],
        isRejected: json["isRejected"],
        isCompleted: json["isCompleted"],
        feedbackType: json["feedbackType"],
        uniqueIDs: List<String>.from(json["uniqueIDs"].map((x) => x)),
      
        url: json["url"],
        cloudinaryId: json["cloudinary_id"],
        v: json["__v"],
        approvedDate: json["approvedDate"] == null
            ? null
            : DateTime.parse(json["approvedDate"]),
        archivedDate: json["archivedDate"] == null
            ? null
            : DateTime.parse(json["archivedDate"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "message": message,
        "feedbackLevel": feedbackLevel,
        "createdDate": createdDate!.toIso8601String(),
        "isArchived": isArchived,
        "isApproved": isApproved,
        "isRejected": isRejected,
        "isCompleted": isCompleted,
        "feedbackType": feedbackType,
        "uniqueIDs": List<dynamic>.from(uniqueIDs!.map((x) => x)),
        "url": url,
        "cloudinary_id": cloudinaryId,
        "__v": v,
        "approvedDate":
            approvedDate == null ? null : approvedDate!.toIso8601String(),
        "archivedDate":
            archivedDate == null ? null : archivedDate!.toIso8601String(),
      };
}