class LoginRequestModel {
  int? password;
  String? kodeDriver;

  LoginRequestModel({
    this.password,
    this.kodeDriver,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'password': password,
      'kode_driver': kodeDriver,
    };

    return map;
  }
}

class LoginResponseModels {
  LoginResponseModels({
    this.status,
    this.username,
    this.role,
    this.token,
  });

  int? status;
  String? username;
  String? role;
  String? token;

  factory LoginResponseModels.fromJson(Map<String, dynamic> json) => LoginResponseModels(
        status: json["status"],
        username: json["username"],
        role: json["role"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "username": username,
        "role": role,
        "token": token,
      };
}
