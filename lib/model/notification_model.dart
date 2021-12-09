// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

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
    List<Payload> ?payload;

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        message: json["message"],
        unRead: json["unRead"],
        payload: List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "unRead": unRead,
        "payload": List<dynamic>.from(payload!.map((x) => x.toJson())),
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
        id: json["_id"],
        feedbackId: FeedbackId.fromJson(json["feedback_id"]),
        isClick: json["isClick"],
        notificationDate: DateTime.parse(json["notificationDate"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "feedback_id": feedbackId!.toJson(),
        "isClick": isClick,
        "notificationDate": notificationDate!.toIso8601String(),
        "__v": v,
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
        this.isApproved,
        this.isRejected,
        this.isCompleted,
        this.feedbackType,
        this.uniqueIDs,
        this.managerContact,
        this.url,
        this.cloudinaryId,
        this.v,
    });

    FeedbackLocation? feedbackLocation;
    String? id;
    String? title;
    String? message;
    String ?feedbackLevel;
    DateTime? createdDate;
    bool? isApproved;
    bool? isRejected;
    bool? isCompleted;
    String? feedbackType;
    List<String>? uniqueIDs;
    List<ManagerContact>? managerContact;
    String? url;
    String? cloudinaryId;
    int? v;

    factory FeedbackId.fromJson(Map<String, dynamic> json) => FeedbackId(
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
        managerContact: List<ManagerContact>.from(json["managerContact"].map((x) => ManagerContact.fromJson(x))),
        url: json["url"],
        cloudinaryId: json["cloudinary_id"],
        v: json["__v"],
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
        "managerContact": List<dynamic>.from(managerContact!.map((x) => x.toJson())),
        "url": url,
        "cloudinary_id": cloudinaryId,
        "__v": v,
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
