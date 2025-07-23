import 'dart:convert';

class AddressModel {
  String? name;
  String? details;
  String? phone;
  String? city;

  AddressModel({
    this.name,
    this.details,
    this.phone,
    this.city,
  });

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "name": name,
        "details": details,
        "phone": phone,
        "city": city,
      };
}
