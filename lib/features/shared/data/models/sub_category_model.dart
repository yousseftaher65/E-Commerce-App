class SubCategoryModel {
  int? results;
  Metadata? metadata;
  List<Data>? data;
  String? message;
  String? statusMsg;

  SubCategoryModel({this.results, this.metadata, this.data , this.message , this.statusMsg});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}

class Data {
  String? sId;
  String? name;
  String? slug;
  String? category;
  String? createdAt;
  String? updatedAt;
  

  Data(
      {this.sId,
      this.name,
      this.slug,
      this.category,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
