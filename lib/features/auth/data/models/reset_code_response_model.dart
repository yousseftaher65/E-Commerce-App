class ResetCodeResponseModel {
  String? status;
  String? statusMsg;
  String? message;

  ResetCodeResponseModel({this.status});

  ResetCodeResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];
  }
}
