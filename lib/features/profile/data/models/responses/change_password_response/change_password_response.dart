import 'user.dart';

class ChangePasswordResponse {
  String? message;
  User? user;
  String? token;

  ChangePasswordResponse({this.message, this.user, this.token});

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) {
    return ChangePasswordResponse(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'user': user?.toJson(),
    'token': token,
  };
}
