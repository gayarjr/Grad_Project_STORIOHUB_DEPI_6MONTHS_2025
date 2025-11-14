import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/features/profile/data/models/requests/address_request.dart';
import 'package:gradprojectstorio/features/profile/data/models/responses/address_response.dart';
import 'package:gradprojectstorio/features/profile/domain/repos/profile_repo.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit({required this.profileRepo}) : super(AddressInitial());

  final ProfileRepo profileRepo;

  Future<void> getAddress() async {
    emit(AddressLoading());
    final result = await profileRepo.getAddress();
    result.fold(
      (failure) => emit(AddressError(message: failure.message)),
      (addresses) => emit(AddressLoaded(addresses: addresses)),
    );
  }

  Future<void> addAddress({required AddressRequest request}) async {
    emit(AddressLoading());
    final result = await profileRepo.addAddress(request: request);
    result.fold(
      (failure) => emit(AddressError(message: failure.message)),
      (addresses) => emit(AddressLoaded(addresses: addresses)),
    );
  }

  Future<void> deleteAddress({required String id}) async {
    emit(AddressLoading());
    final result = await profileRepo.deleteAddress(addressId: id);
    result.fold(
      (failure) => emit(AddressError(message: failure.message)),
      (addresses) => emit(AddressLoaded(addresses: addresses)),
    );
  }
}
