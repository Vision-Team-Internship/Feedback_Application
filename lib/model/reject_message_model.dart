// To parse this JSON data, do
//
//     final rejectModel = rejectModelFromJson(jsonString);

import 'dart:convert';

RejectedModel rejectedModelFromJson(String str) => RejectedModel.fromJson(json.decode(str));

String rejectedModelToJson(RejectedModel data) => json.encode(data.toJson());

class RejectedModel {
    RejectedModel({
        this.message,
        this.count,
        this.payload,
    });

    String? message;
    int? count;
    List<Payload>? payload;

    factory RejectedModel.fromJson(Map<String, dynamic> json) => RejectedModel(
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
        this.isApproved,
        this.isRejected,
        this.isCompleted,
        this.feedbackType,
        this.uniqueIDs,
        this.managerContact,
        this.url,
        this.cloudinaryId,
        this.v,
        this.rejectedDate,
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
    List<ManagerContact>? managerContact;
    String? url;
    String? cloudinaryId;
    int? v;
    DateTime? rejectedDate;

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
        managerContact: List<ManagerContact>.from(json["managerContact"].map((x) => ManagerContact.fromJson(x))),
        url: json["url"],
        cloudinaryId: json["cloudinary_id"],
        v: json["__v"],
        rejectedDate: DateTime.parse(json["rejectedDate"]),
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
        "rejectedDate": rejectedDate!.toIso8601String(),
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
