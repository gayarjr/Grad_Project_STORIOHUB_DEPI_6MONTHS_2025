import 'package:dartz/dartz.dart';
import 'package:gradprojectstorio/core/errors/failure.dart';
import 'package:gradprojectstorio/features/profile/data/models/requests/address_request.dart';
import 'package:gradprojectstorio/features/profile/data/models/requests/change_password_request.dart';
import 'package:gradprojectstorio/features/profile/data/models/requests/update_me_request.dart';
import 'package:gradprojectstorio/features/profile/data/models/responses/address_response.dart';

abstract class ProfileRepo {
  Future<Either<Failure, void>> updateMe({required UpdateMeRequest request});
  Future<Either<Failure, void>> changePassword({
    required ChangePasswordRequest request,
  });
  Future<Either<Failure, List<AddressResponse>>> getAddress();
  Future<Either<Failure, List<AddressResponse>>> addAddress({
    required AddressRequest request,
  });
  Future<Either<Failure, List<AddressResponse>>> deleteAddress({
    required String addressId,
  });
}
