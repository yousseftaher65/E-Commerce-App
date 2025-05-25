import 'dart:convert';

class WishlistModel {
  String? status;
  String? message;
  List<String>? data;
  String? statusMsg;

  WishlistModel({
    this.status,
    this.message,
    this.data,
    this.statusMsg,
  });

  factory WishlistModel.fromRawJson(String str) =>
      WishlistModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
        status: json["status"],
        statusMsg: json["statusMsg"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<String>.from(json["data"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "statusMsg": statusMsg,
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
      };
}
