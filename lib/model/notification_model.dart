// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
    NotificationModel({
        this.message,
        this.unRead,
        this.payload,
    });

    String? message;
    int? unRead;
    List<Payload>? payload;

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        message: json["message"] == null ? null : json["message"],
        unRead: json["unRead"] == null ? null : json["unRead"],
        payload: json["payload"] == null ? null : List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "unRead": unRead == null ? null : unRead,
        "payload": payload == null ? null : List<dynamic>.from(payload!.map((x) => x.toJson())),
    };
}

class Payload {
    Payload({
        this.id,
        this.feedbackId,
        this.isClick,
        this.notificationDate,
        this.v,
    });

    String? id;
    FeedbackId? feedbackId;
    bool? isClick;
    DateTime? notificationDate;
    int? v;

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["_id"] == null ? null : json["_id"],
        feedbackId: json["feedback_id"] == null ? null : FeedbackId.fromJson(json["feedback_id"]),
        isClick: json["isClick"] == null ? null : json["isClick"],
        notificationDate: json["notificationDate"] == null ? null : DateTime.parse(json["notificationDate"]),
        v: json["__v"] == null ? null : json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "feedback_id": feedbackId == null ? null : feedbackId?.toJson(),
        "isClick": isClick == null ? null : isClick,
        "notificationDate": notificationDate == null ? null : notificationDate?.toIso8601String(),
        "__v": v == null ? null : v,
    };
}

class FeedbackId {
    FeedbackId({
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
        this.managerContact,
        this.url,
        this.cloudinaryId,
        this.v,
        this.archivedDate,
        this.approvedDate,
        this.completedDate,
    });

    FeedbackLocation? feedbackLocation;
    String ?id;
    String? title;
    String? message;
    String? feedbackLevel;
    DateTime? createdDate;
    bool? isArchived;
    bool? isApproved;
    bool ?isRejected;
    bool? isCompleted;
    String? feedbackType;
    List<String>? uniqueIDs;
    List<ManagerContact>? managerContact;
    String? url;
    String ?cloudinaryId;
    int? v;
    DateTime? archivedDate;
    DateTime? approvedDate;
    DateTime? completedDate;

    factory FeedbackId.fromJson(Map<String, dynamic> json) => FeedbackId(
        feedbackLocation: json["feedbackLocation"] == null ? null : FeedbackLocation.fromJson(json["feedbackLocation"]),
        id: json["_id"] == null ? null : json["_id"],
        title: json["title"] == null ? null : json["title"],
        message: json["message"] == null ? null : json["message"],
        feedbackLevel: json["feedbackLevel"] == null ? null : json["feedbackLevel"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        isArchived: json["isArchived"] == null ? null : json["isArchived"],
        isApproved: json["isApproved"] == null ? null : json["isApproved"],
        isRejected: json["isRejected"] == null ? null : json["isRejected"],
        isCompleted: json["isCompleted"] == null ? null : json["isCompleted"],
        feedbackType: json["feedbackType"] == null ? null : json["feedbackType"],
        uniqueIDs: json["uniqueIDs"] == null ? null : List<String>.from(json["uniqueIDs"].map((x) => x)),
        managerContact: json["managerContact"] == null ? null : List<ManagerContact>.from(json["managerContact"].map((x) => ManagerContact.fromJson(x))),
        url: json["url"] == null ? null : json["url"],
        cloudinaryId: json["cloudinary_id"] == null ? null : json["cloudinary_id"],
        v: json["__v"] == null ? null : json["__v"],
        archivedDate: json["archivedDate"] == null ? null : DateTime.parse(json["archivedDate"]),
        approvedDate: json["approvedDate"] == null ? null : DateTime.parse(json["approvedDate"]),
        completedDate: json["completedDate"] == null ? null : DateTime.parse(json["completedDate"]),
    );

    Map<String, dynamic> toJson() => {
        "feedbackLocation": feedbackLocation == null ? null : feedbackLocation?.toJson(),
        "_id": id == null ? null : id,
        "title": title == null ? null : title,
        "message": message == null ? null : message,
        "feedbackLevel": feedbackLevel == null ? null : feedbackLevel,
        "createdDate": createdDate == null ? null : createdDate?.toIso8601String(),
        "isArchived": isArchived == null ? null : isArchived,
        "isApproved": isApproved == null ? null : isApproved,
        "isRejected": isRejected == null ? null : isRejected,
        "isCompleted": isCompleted == null ? null : isCompleted,
        "feedbackType": feedbackType == null ? null : feedbackType,
        "uniqueIDs": uniqueIDs == null ? null : List<dynamic>.from(uniqueIDs!.map((x) => x)),
        "managerContact": managerContact == null ? null : List<dynamic>.from(managerContact!.map((x) => x.toJson())),
        "url": url == null ? null : url,
        "cloudinary_id": cloudinaryId == null ? null : cloudinaryId,
        "__v": v == null ? null : v,
        "archivedDate": archivedDate == null ? null : archivedDate!.toIso8601String(),
        "approvedDate": approvedDate == null ? null : approvedDate!.toIso8601String(),
        "completedDate": completedDate == null ? null : completedDate!.toIso8601String(),
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
        floor: json["floor"] == null ? null : List<String>.from(json["floor"].map((x) => x)),
        department: json["department"] == null ? null : List<String>.from(json["department"].map((x) => x)),
        room: json["room"] == null ? null : List<String>.from(json["room"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "floor": floor == null ? null : List<dynamic>.from(floor!.map((x) => x)),
        "department": department == null ? null : List<dynamic>.from(department!.map((x) => x)),
        "room": room == null ? null : List<dynamic>.from(room!.map((x) => x)),
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
        id: json["_id"] == null ? null : json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "location": location == null ? null : location,
        "cardID": cardId == null ? null : cardId,
        "username": username == null ? null : username,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "_id": id == null ? null : id,
    };
}
