class AuthResponseEntity {
  String? message;
  String? statusMsg;
  UserEntity? user;
  String? token;

  AuthResponseEntity({this.message, this.user, this.token , this.statusMsg});
}

class UserEntity {
  String? name;
  String? email;

  UserEntity({this.name, this.email});
}
