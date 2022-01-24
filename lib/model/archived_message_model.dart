// To parse this JSON data, do
//
//     final archivedMessageModel = archivedMessageModelFromJson(jsonString);

import 'dart:convert';

ArchivedMessageModel archivedMessageModelFromJson(String str) => ArchivedMessageModel.fromJson(json.decode(str));

String archivedMessageModelToJson(ArchivedMessageModel data) => json.encode(data.toJson());

class ArchivedMessageModel {
    ArchivedMessageModel({
        this.message,
        this.count,
        this.payload,
    });

    String? message;
    int? count;
    List<Payload>? payload;

    factory ArchivedMessageModel.fromJson(Map<String, dynamic> json) => ArchivedMessageModel(
        message: json["message"],
        count: json["count"],
        payload: List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "count": count,
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
        this.isArchived,
        this.isApproved,
        this.isRejected,
        this.isCompleted,
        this.feedbackType,
        this.uniqueIDs,
        this.isOpen,
        this.managerContact,
        this.v,
        this.archivedDate,
    });

    FeedbackLocation? feedbackLocation;
    String? id;
    String? title;
    String? message;
    String? feedbackLevel;
    DateTime? createdDate;
    bool? isArchived;
    bool? isApproved;
    bool? isRejected;
    bool? isCompleted;
    String?feedbackType;
    List<String>? uniqueIDs;
    bool? isOpen;
    List<ManagerContact>? managerContact;
    int? v;
    DateTime? archivedDate;

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        feedbackLocation: FeedbackLocation.fromJson(json["feedbackLocation"]),
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
        isOpen: json["isOpen"],
        managerContact: List<ManagerContact>.from(json["managerContact"].map((x) => ManagerContact.fromJson(x))),
        v: json["__v"],
        archivedDate: DateTime.parse(json["archivedDate"]),
    );

    Map<String, dynamic> toJson() => {
        "feedbackLocation": feedbackLocation!.toJson(),
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
        "isOpen": isOpen,
        "managerContact": List<dynamic>.from(managerContact!.map((x) => x.toJson())),
        "__v": v,
        "archivedDate": archivedDate!.toIso8601String(),
    };
}

class FeedbackLocation {
    FeedbackLocation({
        this.floor,
        this.department,
        this.room,
    });

    List<String>? floor;
    List<String>? department;
    List<String>? room;

    factory FeedbackLocation.fromJson(Map<String, dynamic> json) => FeedbackLocation(
        floor: List<String>.from(json["floor"].map((x) => x)),
        department: List<String>.from(json["department"].map((x) => x)),
        room: List<String>.from(json["room"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "floor": List<dynamic>.from(floor!.map((x) => x)),
        "department": List<dynamic>.from(department!.map((x) => x)),
        "room": List<dynamic>.from(room!.map((x) => x)),
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
