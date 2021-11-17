// ignore_for_file: prefer_if_null_operators

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
        this.feedbackLocation,
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
        this.managerContact,
    });

    dynamic feedbackLocation;
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
    List<ManagerContact>? managerContact;

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        feedbackLocation: json["feedbackLocation"],
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
        managerContact: List<ManagerContact>.from(json["managerContact"].map((x) => ManagerContact.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "feedbackLocation": feedbackLocation,
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
        "managerContact": List<dynamic>.from(managerContact!.map((x) => x.toJson())),
    };
}

class FeedbackLocationClass {
    FeedbackLocationClass({
        this.room,
        this.floor,
        this.department,
    });

    List<String>? room;
    List<String>? floor;
    List<String>? department;

    factory FeedbackLocationClass.fromJson(Map<String, dynamic> json) => FeedbackLocationClass(
        room: List<String>.from(json["room"].map((x) => x)),
        floor: List<String>.from(json["floor"].map((x) => x)),
        department: List<String>.from(json["department"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "room": List<dynamic>.from(room!.map((x) => x)),
        "floor": List<dynamic>.from(floor!.map((x) => x)),
        "department": List<dynamic>.from(department!.map((x) => x)),
    };
}

class ManagerContact {
    ManagerContact({
        this.location,
        this.cardId,
        this.username,
        this.phoneNumber,
        this.id,
    });

    String? location;
    String? cardId;
    String? username;
    int? phoneNumber;
    String? id;

    factory ManagerContact.fromJson(Map<String, dynamic> json) => ManagerContact(
        location: json["location"] == null ? null : json["location"],
        cardId: json["cardID"] == null ? null : json["cardID"],
        username: json["username"] == null ? null : json["username"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "location": location == null ? null : location,
        "cardID": cardId == null ? null : cardId,
        "username": username == null ? null : username,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "_id": id,
    };
}
