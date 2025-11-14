class AddressRequest {
  String? name;
  String? details;
  String? phone;
  String? city;

  AddressRequest({this.name, this.details, this.phone, this.city});

  factory AddressRequest.fromJson(Map<String, dynamic> json) {
    return AddressRequest(
      name: json['name'] as String?,
      details: json['details'] as String?,
      phone: json['phone'] as String?,
      city: json['city'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'details': details,
    'phone': phone,
    'city': city,
  };
}
