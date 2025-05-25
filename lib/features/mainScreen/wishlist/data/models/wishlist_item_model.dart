import 'dart:convert';

class WishlistItemModel {
  String? statusMsg;
  String? status;
  int? count;
  List<Data>? data;

  WishlistItemModel({
    this.status,
    this.count,
    this.data,
    this.statusMsg,
  });

  factory WishlistItemModel.fromRawJson(String str) =>
      WishlistItemModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WishlistItemModel.fromJson(Map<String, dynamic> json) =>
      WishlistItemModel(
        statusMsg: json["statusMsg"],
        status: json["status"],
        count: json["count"],
        data: json["data"] == null
            ? []
            : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusMsg": statusMsg,
        "status": status,
        "count": count,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Data {
  int? sold;
  List<String>? images;
  List<Category>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  Category? category;
  dynamic brand;
  double? ratingsAverage;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? datumId;

  Data({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.datumId,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sold: json["sold"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        subcategory: json["subcategory"] == null
            ? []
            : List<Category>.from(
                json["subcategory"]!.map((x) => Category.fromJson(x))),
        ratingsQuantity: json["ratingsQuantity"],
        id: json["_id"],
        title: json["title"],
        slug: json["slug"],
        description: json["description"],
        quantity: json["quantity"],
        price: json["price"],
        imageCover: json["imageCover"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        brand: json["brand"],
        ratingsAverage: json["ratingsAverage"]?.toDouble(),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        datumId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "sold": sold,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "subcategory": subcategory == null
            ? []
            : List<dynamic>.from(subcategory!.map((x) => x.toJson())),
        "ratingsQuantity": ratingsQuantity,
        "_id": id,
        "title": title,
        "slug": slug,
        "description": description,
        "quantity": quantity,
        "price": price,
        "imageCover": imageCover,
        "category": category?.toJson(),
        "brand": brand,
        "ratingsAverage": ratingsAverage,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "id": datumId,
      };
}

class Category {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? category;

  Category({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.category,
  });

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "category": category,
      };
}
