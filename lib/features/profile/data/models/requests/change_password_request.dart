class ChangePasswordRequest {
  String? currentPassword;
  String? password;
  String? rePassword;

  ChangePasswordRequest({this.currentPassword, this.password, this.rePassword});

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) {
    return ChangePasswordRequest(
      currentPassword: json['currentPassword'] as String?,
      password: json['password'] as String?,
      rePassword: json['rePassword'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'currentPassword': currentPassword,
    'password': password,
    'rePassword': rePassword,
  };
}
