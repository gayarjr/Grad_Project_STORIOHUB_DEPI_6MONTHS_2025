import '../../domain/entities/delivery_address.dart';

class DeliveryAddressModel extends DeliveryAddress {
  DeliveryAddressModel({
    required super.id,
    required super.label,
    required super.address,
    required super.isDefault,
  });

  factory DeliveryAddressModel.fromJson(Map<String, dynamic> json) {
    return DeliveryAddressModel(
      id: json['id'],
      label: json['label'],
      address: json['address'],
      isDefault: json['isDefault'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'address': address,
      'isDefault': isDefault,
    };
  }
}