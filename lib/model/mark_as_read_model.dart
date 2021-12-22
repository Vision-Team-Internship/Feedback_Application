// To parse this JSON data, do
//
//     final markAsReadModel = markAsReadModelFromJson(jsonString);

import 'dart:convert';

MarkAsReadModel markAsReadModelFromJson(String str) => MarkAsReadModel.fromJson(json.decode(str));

String markAsReadModelToJson(MarkAsReadModel data) => json.encode(data.toJson());

class MarkAsReadModel {
    MarkAsReadModel({
        this.message,
        this.payload,
    });

    String? message;
    Payload? payload;

    factory MarkAsReadModel.fromJson(Map<String, dynamic> json) => MarkAsReadModel(
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
        this.acknowledged,
        this.modifiedCount,
        this.upsertedId,
        this.upsertedCount,
        this.matchedCount,
    });

    bool? acknowledged;
    int? modifiedCount;
    dynamic? upsertedId;
    int? upsertedCount;
    int? matchedCount;

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        acknowledged: json["acknowledged"],
        modifiedCount: json["modifiedCount"],
        upsertedId: json["upsertedId"],
        upsertedCount: json["upsertedCount"],
        matchedCount: json["matchedCount"],
    );

    Map<String, dynamic> toJson() => {
        "acknowledged": acknowledged,
        "modifiedCount": modifiedCount,
        "upsertedId": upsertedId,
        "upsertedCount": upsertedCount,
        "matchedCount": matchedCount,
    };
}
