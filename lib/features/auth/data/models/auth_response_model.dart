import 'package:ecommerce_pojo/features/auth/domain/entities/auth_response_entity.dart';

class AuthResponseModel extends AuthResponseEntity {


  AuthResponseModel({super.message, super.user, super.token, super.statusMsg});

  AuthResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }
}

class UserModel extends UserEntity {
    String? role;
  UserModel({super.name, super.email , this.role});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
}
