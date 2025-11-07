class ShippingAddress {
  String? details;
  String? phone;
  String? city;

  ShippingAddress({this.details, this.phone, this.city});

  factory ShippingAddress.fromJson(Map<String, dynamic> json) {
    return ShippingAddress(
      details: json['details'] as String?,
      phone: json['phone'] as String?,
      city: json['city'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'details': details,
    'phone': phone,
    'city': city,
  };
}
