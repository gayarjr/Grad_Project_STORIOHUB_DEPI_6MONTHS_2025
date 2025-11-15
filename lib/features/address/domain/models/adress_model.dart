class AdressModel {
  final String fullAddress;
  final String state;
  final String city;
  final String phone;
  AdressModel({
    required this.fullAddress,
    required this.state,
    required this.city,
    required this.phone,
  });

  Map<String, dynamic> tojson() {
    return {
      'fullAddress': fullAddress,
      'state': state,
      'city': city,
      'phone': phone,
    };
  }

  factory AdressModel.fromJson(Map<String, dynamic> json) {
    return AdressModel(
      fullAddress: json['fullAddress'] ?? '',
      state: json['state'] ?? '',
      city: json['city'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
}

// class AddressModel {
//   final String fullAddress;
//   final String state;
//   final String city;
//   final String phone;

//   AddressModel({
//     required this.fullAddress,
//     required this.state,
//     required this.city,
//     required this.phone,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'fullAddress': fullAddress,
//       'state': state,
//       'city': city,
//       'phone': phone,
//     };
//   }

//   factory AddressModel.fromJson(Map<String, dynamic> json) {
//     return AddressModel(
//       fullAddress: json['fullAddress'] ?? '',
//       state: json['state'] ?? '',
//       city: json['city'] ?? '',
//       phone: json['phone'] ?? '',
//     );
//   }
// }
