class UpdateMeRequest {
  String? name;
  String? email;
  String? phone;

  UpdateMeRequest({this.name, this.email, this.phone});

  factory UpdateMeRequest.fromJson(Map<String, dynamic> json) {
    return UpdateMeRequest(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (name != null && name!.isNotEmpty) data['name'] = name;
    if (email != null && email!.isNotEmpty) data['email'] = email;
    if (phone != null && phone!.isNotEmpty) data['phone'] = phone;
    return data;
  }
}
