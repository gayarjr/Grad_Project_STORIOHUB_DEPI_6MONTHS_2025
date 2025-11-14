import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/features/profile/data/models/requests/update_me_request.dart';
import 'package:gradprojectstorio/features/profile/domain/repos/profile_repo.dart';

part 'update_me_state.dart';

class UpdateMeCubit extends Cubit<UpdateMeState> {
  UpdateMeCubit({required this.profileRepo}) : super(UpdateMeInitial());

  final ProfileRepo profileRepo;

  Future<void> updateMe({required UpdateMeRequest request}) async {
    emit(UpdateMeLoading());
    final result = await profileRepo.updateMe(request: request);
    result.fold(
      (failure) => emit(UpdateMeError(message: failure.message)),
      (user) => emit(UpdateMeLoaded()),
    );
  }
}
