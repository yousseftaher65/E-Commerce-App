class SignupRequestModel {
  String? name;
  String? email;
  String? password;
  String? rePassword;
  String? phone;

  SignupRequestModel(
      {this.name, this.email, this.password, this.rePassword, this.phone});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['rePassword'] = rePassword;
    data['phone'] = phone;
    return data;
  }
}
