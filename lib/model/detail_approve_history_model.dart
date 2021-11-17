
import 'dart:convert';

DetailApproveModel detailApproveModelFromJson(String str) => DetailApproveModel.fromJson(json.decode(str));

String detailApproveModelToJson(DetailApproveModel data) => json.encode(data.toJson());

class DetailApproveModel {
    DetailApproveModel({
        required this.message,
        required this.payload,
    });

    String message;
    List<Payload> payload;

    factory DetailApproveModel.fromJson(Map<String, dynamic> json) => DetailApproveModel(
        message: json["message"],
        payload: List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "payload": List<dynamic>.from(payload.map((x) => x.toJson())),
    };
}

class Payload {
    Payload({
        required this.id,
        required this.note,
        required this.createdDate,
        required this.feedbackId,
        required this.v,
    });

    String id;
    String note;
    DateTime createdDate;
    String feedbackId;
    int v;

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
        "createdDate": createdDate.toIso8601String(),
        "feedback_id": feedbackId,
        "__v": v,
    };
}
