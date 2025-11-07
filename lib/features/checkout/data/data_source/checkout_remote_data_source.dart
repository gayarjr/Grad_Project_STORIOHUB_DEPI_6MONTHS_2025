import 'package:gradprojectstorio/core/services/api_service.dart';
import 'package:gradprojectstorio/core/services/shared_preferences_service.dart';
import 'package:gradprojectstorio/features/checkout/data/models/request/chechout_request/checkout_request.dart';
import 'package:gradprojectstorio/features/checkout/data/models/response/cash_response/cash_response.dart';

abstract class CheckoutRemoteDataSource {
  Future<CashResponse> cash({
    required CheckoutRequest request,
    required String cartId,
  });
}

class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
  final ApiService apiService;
  CheckoutRemoteDataSourceImpl({required this.apiService});

  @override
  Future<CashResponse> cash({
    required CheckoutRequest request,
    required String cartId,
  }) async {
    final response = await apiService.post(
      endPoint: '/orders/$cartId',
      data: request.toJson(),
    );
    var cashResponse = CashResponse.fromJson(response);
    Prefs.setCartId(cashResponse.user ?? '');
    return cashResponse;
  }
}
