// import 'dart:convert';

// class ProductModel {
//     final int? results;
//     final Metadata? metadata;
//     final List<Data>? data;

//     ProductModel({
//         this.results,
//         this.metadata,
//         this.data,
//     });

//     factory ProductModel.fromRawJson(String str) => ProductModel.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//         results: json["results"],
//         metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
//         data: json["data"] == null ? [] : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "results": results,
//         "metadata": metadata?.toJson(),
//         "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
//     };
// }

// class Data {
//     final int? sold;
//     final List<String>? images;
//     final List<Brand>? subcategory;
//     final int? ratingsQuantity;
//     final Id? id;
//     final String? title;
//     final String? slug;
//     final String? description;
//     final int? quantity;
//     final int? price;
//     final String? imageCover;
//     final Brand? category;
//     final Brand? brand;
//     final double? ratingsAverage;
//     final DateTime? createdAt;
//     final DateTime? updatedAt;
//     final int? v;
//     final List<Review>? reviews;
//     final Id? dataId;

//     Data({
//         this.sold,
//         this.images,
//         this.subcategory,
//         this.ratingsQuantity,
//         this.id,
//         this.title,
//         this.slug,
//         this.description,
//         this.quantity,
//         this.price,
//         this.imageCover,
//         this.category,
//         this.brand,
//         this.ratingsAverage,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//         this.reviews,
//         this.dataId,
//     });

//     factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         sold: json["sold"],
//         images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
//         subcategory: json["subcategory"] == null ? [] : List<Brand>.from(json["subcategory"]!.map((x) => Brand.fromJson(x))),
//         ratingsQuantity: json["ratingsQuantity"],
//         id: idValues.map[json["_id"]]!,
//         title: json["title"],
//         slug: json["slug"],
//         description: json["description"],
//         quantity: json["quantity"],
//         price: json["price"],
//         imageCover: json["imageCover"],
//         category: json["category"] == null ? null : Brand.fromJson(json["category"]),
//         brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
//         ratingsAverage: json["ratingsAverage"]?.toDouble(),
//         createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//         reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
//         dataId: idValues.map[json["id"]]!,
//     );

//     Map<String, dynamic> toJson() => {
//         "sold": sold,
//         "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
//         "subcategory": subcategory == null ? [] : List<dynamic>.from(subcategory!.map((x) => x.toJson())),
//         "ratingsQuantity": ratingsQuantity,
//         "_id": idValues.reverse[id],
//         "title": title,
//         "slug": slug,
//         "description": description,
//         "quantity": quantity,
//         "price": price,
//         "imageCover": imageCover,
//         "category": category?.toJson(),
//         "brand": brand?.toJson(),
//         "ratingsAverage": ratingsAverage,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "__v": v,
//         "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x.toJson())),
//         "id": idValues.reverse[dataId],
//     };
// }

// class Brand {
//     final String? id;
//     final String? name;
//     final String? slug;
//     final String? image;
//     final String? category;

//     Brand({
//         this.id,
//         this.name,
//         this.slug,
//         this.image,
//         this.category,
//     });

//     factory Brand.fromRawJson(String str) => Brand.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Brand.fromJson(Map<String, dynamic> json) => Brand(
//         id: json["_id"],
//         name: json["name"],
//         slug: json["slug"],
//         image: json["image"],
//         category: json["category"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "name": name,
//         "slug": slug,
//         "image": image,
//         "category": category,
//     };
// }

// enum Id {
//     THE_6428_EBC6_DC1175_ABC65_CA0_B9
// }

// final idValues = EnumValues({
//     "6428ebc6dc1175abc65ca0b9": Id.THE_6428_EBC6_DC1175_ABC65_CA0_B9
// });

// enum Category {
//     THE_6439_D2_D167_D9_AA4_CA970649_F,
//     THE_6439_D58_A0049_AD0_B52_B9003_F,
//     THE_6439_D5_B90049_AD0_B52_B90048
// }

// final categoryValues = EnumValues({
//     "6439d2d167d9aa4ca970649f": Category.THE_6439_D2_D167_D9_AA4_CA970649_F,
//     "6439d58a0049ad0b52b9003f": Category.THE_6439_D58_A0049_AD0_B52_B9003_F,
//     "6439d5b90049ad0b52b90048": Category.THE_6439_D5_B90049_AD0_B52_B90048
// });

// class Metadata {
//     final int? currentPage;
//     final int? numberOfPages;
//     final int? limit;
//     final int? nextPage;

//     Metadata({
//         this.currentPage,
//         this.numberOfPages,
//         this.limit,
//         this.nextPage,
//     });

//     factory Metadata.fromRawJson(String str) => Metadata.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
//         currentPage: json["currentPage"],
//         numberOfPages: json["numberOfPages"],
//         limit: json["limit"],
//         nextPage: json["nextPage"],
//     );

//     Map<String, dynamic> toJson() => {
//         "currentPage": currentPage,
//         "numberOfPages": numberOfPages,
//         "limit": limit,
//         "nextPage": nextPage,
//     };
// }

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//             reverseMap = map.map((k, v) => MapEntry(v, k));
//             return reverseMap;
//     }
// }

// class Review {
//     final String? id;
//     final String? review;
//     final int? rating;
//     final String? product;
//     final User? user;
//     final DateTime? createdAt;
//     final DateTime? updatedAt;
//     final int? v;

//     Review({
//         this.id,
//         this.review,
//         this.rating,
//         this.product,
//         this.user,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//     });

//     factory Review.fromRawJson(String str) => Review.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Review.fromJson(Map<String, dynamic> json) => Review(
//         id: json["_id"],
//         review: json["review"],
//         rating: json["rating"],
//         product: json["product"],
//         user: json["user"] == null ? null : User.fromJson(json["user"]),
//         createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "review": review,
//         "rating": rating,
//         "product": product,
//         "user": user?.toJson(),
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "__v": v,
//     };
// }

// class User {
//     final String? id;
//     final String? name;

//     User({
//         this.id,
//         this.name,
//     });

//     factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["_id"],
//         name: json["name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "name": name,
//     };
// }
// 

import 'dart:convert';

class ProductModel {
    final int? results;
    final Metadata? metadata;
    final List<Data>? data;

    ProductModel({
        this.results,
        this.metadata,
        this.data,
    });

    factory ProductModel.fromRawJson(String str) => ProductModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        results: json["results"],
        metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
        data: json["data"] == null ? [] : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "results": results,
        "metadata": metadata?.toJson(),
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
    final String? dataId;
    final int? priceAfterDiscount;

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
        this.dataId,
        this.priceAfterDiscount,
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
        dataId: json["id"],
        priceAfterDiscount: json["priceAfterDiscount"],
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
        "id": dataId,
        "priceAfterDiscount": priceAfterDiscount,
    };
}

class Brand {
    final Id? id;
    final Name? name;
    final Slug? slug;
    final String? image;
    final Id? category;

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
        id: idValues.map[json["_id"]],
        name: nameValues.map[json["name"]],
        slug: slugValues.map[json["slug"]],
        image: json["image"],
        category: idValues.map[json["category"]],
    );

    Map<String, dynamic> toJson() => {
        "_id": idValues.reverse[id],
        "name": nameValues.reverse[name],
        "slug": slugValues.reverse[slug],
        "image": image,
        "category": idValues.reverse[category],
    };
}

enum Id {
    THE_6407_F1_BCB575_D3_B90_BF95797,
    THE_64089_BBE24_B25627_A253158_B,
    THE_6439_D58_A0049_AD0_B52_B9003_F
}

final idValues = EnumValues({
    "6407f1bcb575d3b90bf95797": Id.THE_6407_F1_BCB575_D3_B90_BF95797,
    "64089bbe24b25627a253158b": Id.THE_64089_BBE24_B25627_A253158_B,
    "6439d58a0049ad0b52b9003f": Id.THE_6439_D58_A0049_AD0_B52_B9003_F
});

enum Name {
    DE_FACTO,
    WOMEN_S_CLOTHING,
    WOMEN_S_FASHION
}

final nameValues = EnumValues({
    "DeFacto": Name.DE_FACTO,
    "Women's Clothing": Name.WOMEN_S_CLOTHING,
    "Women's Fashion": Name.WOMEN_S_FASHION
});

enum Slug {
    DEFACTO,
    WOMEN_S_CLOTHING,
    WOMEN_S_FASHION
}

final slugValues = EnumValues({
    "defacto": Slug.DEFACTO,
    "women's-clothing": Slug.WOMEN_S_CLOTHING,
    "women's-fashion": Slug.WOMEN_S_FASHION
});

class Metadata {
    final int? currentPage;
    final int? numberOfPages;
    final int? limit;

    Metadata({
        this.currentPage,
        this.numberOfPages,
        this.limit,
    });

    factory Metadata.fromRawJson(String str) => Metadata.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        currentPage: json["currentPage"],
        numberOfPages: json["numberOfPages"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "numberOfPages": numberOfPages,
        "limit": limit,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
