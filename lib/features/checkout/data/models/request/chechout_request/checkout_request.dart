import 'shipping_address.dart';

class CheckoutRequest {
  ShippingAddress? shippingAddress;

  CheckoutRequest({this.shippingAddress});

  factory CheckoutRequest.fromJson(Map<String, dynamic> json) {
    return CheckoutRequest(
      shippingAddress: json['shippingAddress'] == null
          ? null
          : ShippingAddress.fromJson(
              json['shippingAddress'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() => {
    'shippingAddress': shippingAddress?.toJson(),
  };
}
