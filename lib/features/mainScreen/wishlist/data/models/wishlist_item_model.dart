import 'dart:convert';

class WishlistItemModel {
    final String? status;
    final int? count;
    final List<Data>? data;

    WishlistItemModel({
        this.status,
        this.count,
        this.data,
    });

    factory WishlistItemModel.fromRawJson(String str) => WishlistItemModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WishlistItemModel.fromJson(Map<String, dynamic> json) => WishlistItemModel(
        status: json["status"],
        count: json["count"],
        data: json["data"] == null ? [] : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "count": count,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Data {
    final double? sold;
    final List<String>? images;
    final List<Brand>? subcategory;
    final int? ratingsQuantity;
    final String? id;
    final String? title;
    final String? slug;
    final String? description;
    final int? quantity;
    final int? price;
    final String? imageCover;
    final Brand? category;
    final Brand? brand;
    final double? ratingsAverage;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;
    final String? datumId;

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
        sold: json["sold"]?.toDouble(),
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
        subcategory: json["subcategory"] == null ? [] : List<Brand>.from(json["subcategory"]!.map((x) => Brand.fromJson(x))),
        ratingsQuantity: json["ratingsQuantity"],
        id: json["_id"],
        title: json["title"],
        slug: json["slug"],
        description: json["description"],
        quantity: json["quantity"],
        price: json["price"],
        imageCover: json["imageCover"],
        category: json["category"] == null ? null : Brand.fromJson(json["category"]),
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        ratingsAverage: json["ratingsAverage"]?.toDouble(),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        datumId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "sold": sold,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "subcategory": subcategory == null ? [] : List<dynamic>.from(subcategory!.map((x) => x.toJson())),
        "ratingsQuantity": ratingsQuantity,
        "_id": id,
        "title": title,
        "slug": slug,
        "description": description,
        "quantity": quantity,
        "price": price,
        "imageCover": imageCover,
        "category": category?.toJson(),
        "brand": brand?.toJson(),
        "ratingsAverage": ratingsAverage,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "id": datumId,
    };
}

class Brand {
    final String? id;
    final String? name;
    final String? slug;
    final String? image;
    final String? category;

    Brand({
        this.id,
        this.name,
        this.slug,
        this.image,
        this.category,
    });

    factory Brand.fromRawJson(String str) => Brand.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
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
