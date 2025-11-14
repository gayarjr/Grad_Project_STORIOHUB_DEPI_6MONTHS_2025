import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/features/profile/data/models/requests/change_password_request.dart';
import 'package:gradprojectstorio/features/profile/domain/repos/profile_repo.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit({required this.profileRepo})
    : super(ChangePasswordInitial());

  final ProfileRepo profileRepo;

  Future<void> changePassword({required ChangePasswordRequest request}) async {
    emit(ChangePasswordLoading());
    final result = await profileRepo.changePassword(request: request);
    result.fold(
      (failure) => emit(ChangePasswordError(message: failure.message)),
      (user) => emit(ChangePasswordLoaded()),
    );
  }
}
