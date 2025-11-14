import 'user.dart';

class UpdateMeResponse {
  String? message;
  User? user;

  UpdateMeResponse({this.message, this.user});

  factory UpdateMeResponse.fromJson(Map<String, dynamic> json) {
    return UpdateMeResponse(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {'message': message, 'user': user?.toJson()};
}
