import 'package:gradprojectstorio/core/services/api_service.dart';
import 'package:gradprojectstorio/features/profile/data/models/requests/address_request.dart';
import 'package:gradprojectstorio/features/profile/data/models/requests/change_password_request.dart';
import 'package:gradprojectstorio/features/profile/data/models/requests/update_me_request.dart';
import 'package:gradprojectstorio/features/profile/data/models/responses/address_response.dart';
import 'package:gradprojectstorio/features/profile/data/models/responses/change_password_response/change_password_response.dart';
import 'package:gradprojectstorio/features/profile/data/models/responses/update_me_response/update_me_response.dart';

abstract class ProfileRemoteDataSource {
  Future<UpdateMeResponse> updateMe({required UpdateMeRequest request});
  Future<ChangePasswordResponse> changePassword({
    required ChangePasswordRequest request,
  });
  Future<List<AddressResponse>> getAddress();
  Future<List<AddressResponse>> addAddress({required AddressRequest request});
  Future<List<AddressResponse>> deleteAddress({required String addressId});
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiService apiService;
  ProfileRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<AddressResponse>> addAddress({
    required AddressRequest request,
  }) async {
    var response = await apiService.post(
      endPoint: '/addresses',
      data: request.toJson(),
    );

    List<AddressResponse> addresses = (response['data'] as List)
        .map((e) => AddressResponse.fromJson(e))
        .toList();

    return addresses;
  }

  @override
  Future<ChangePasswordResponse> changePassword({
    required ChangePasswordRequest request,
  }) async {
    var response = await apiService.put(
      endPoint: '/users/changeMyPassword',
      data: request.toJson(),
    );
    return ChangePasswordResponse.fromJson(response);
  }

  @override
  Future<List<AddressResponse>> getAddress() async {
    var response = await apiService.get(endPoint: '/addresses');
    List<AddressResponse> addresses = (response['data'] as List)
        .map((e) => AddressResponse.fromJson(e))
        .toList();
    return addresses;
  }

  @override
  Future<List<AddressResponse>> deleteAddress({
    required String addressId,
  }) async {
    var response = await apiService.delete(endPoint: '/addresses/$addressId');
    List<AddressResponse> addresses = (response['data'] as List)
        .map((e) => AddressResponse.fromJson(e))
        .toList();
    return addresses;
  }

  @override
  Future<UpdateMeResponse> updateMe({required UpdateMeRequest request}) async {
    var response = await apiService.put(
      endPoint: '/users/updateMe',
      data: request.toJson(),
    );
    return UpdateMeResponse.fromJson(response);
  }
}
