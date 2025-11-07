import 'session.dart';

class VisaResponse {
  String? status;
  Session? session;

  VisaResponse({this.status, this.session});

  factory VisaResponse.fromJson(Map<String, dynamic> json) => VisaResponse(
    status: json['status'] as String?,
    session: json['session'] == null
        ? null
        : Session.fromJson(json['session'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'session': session?.toJson(),
  };
}
