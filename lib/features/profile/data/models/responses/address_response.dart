class AddressResponse {
  String? id;
  String? name;
  String? details;
  String? phone;
  String? city;

  AddressResponse({this.id, this.name, this.details, this.phone, this.city});

  factory AddressResponse.fromJson(Map<String, dynamic> json) {
    return AddressResponse(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      details: json['details'] as String?,
      phone: json['phone'] as String?,
      city: json['city'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
    'details': details,
    'phone': phone,
    'city': city,
  };
}
