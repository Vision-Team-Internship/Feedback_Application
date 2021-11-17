// To parse this JSON data, do
//
//     final detailMessageModel = detailMessageModelFromJson(jsonString);

import 'dart:convert';

DetailMessageModel detailMessageModelFromJson(String str) => DetailMessageModel.fromJson(json.decode(str));

String detailMessageModelToJson(DetailMessageModel data) => json.encode(data.toJson());

class DetailMessageModel {
    DetailMessageModel({
        this.message,
        this.payload,
    });

    String? message;
    Payload? payload;

    factory DetailMessageModel.fromJson(Map<String, dynamic> json) => DetailMessageModel(
        message: json["message"],
        payload: Payload.fromJson(json["payload"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "payload": payload!.toJson(),
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

    FeedbackLocation? feedbackLocation;
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
        feedbackLocation: FeedbackLocation.fromJson(json["feedbackLocation"]),
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
        "feedbackLocation": feedbackLocation!.toJson(),
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

class FeedbackLocation {
    FeedbackLocation({
        this.room,
        this.floor,
        this.department,
    });

    List<dynamic>? room;
    List<String>? floor;
    List<String>? department;

    factory FeedbackLocation.fromJson(Map<String, dynamic> json) => FeedbackLocation(
        room: List<dynamic>.from(json["room"].map((x) => x)),
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
        location: json["location"],
        cardId: json["cardID"],
        username: json["username"],
        phoneNumber: json["phone_number"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "location": location,
        "cardID": cardId,
        "username": username,
        "phone_number": phoneNumber,
        "_id": id,
    };
}
