import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/core/di/service_locator.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/profile/domain/repos/profile_repo.dart';
import 'package:gradprojectstorio/features/profile/presentation/manager/update_me_cubit/update_me_cubit.dart';
import 'package:gradprojectstorio/features/profile/presentation/widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateMeCubit(profileRepo: getIt<ProfileRepo>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Details', style: AppStyles.textSemiBold24),
          centerTitle: true,
        ),
        body: EditProfileViewBody(),
      ),
    );
  }
}
