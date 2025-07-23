import 'dart:convert';

class AddressResponse {
  String? status;
  String? message;
  List<Data>? data;

  AddressResponse({
    this.status,
    this.message,
    this.data,
  });

  factory AddressResponse.fromRawJson(String str) =>
      AddressResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddressResponse.fromJson(Map<String, dynamic> json) => AddressResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Data {
  String? id;
  String? name;
  String? details;
  String? phone;
  String? city;

  Data({
    this.id,
    this.name,
    this.details,
    this.phone,
    this.city,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        name: json["name"],
        details: json["details"],
        phone: json["phone"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "details": details,
        "phone": phone,
        "city": city,
      };
}
