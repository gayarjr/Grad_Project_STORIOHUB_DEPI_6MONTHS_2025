import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/core/services/api_service.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:gradprojectstorio/features/profile/data/repos/profile_repo_impl.dart';
import 'package:gradprojectstorio/features/profile/presentation/manager/update_me_cubit/update_me_cubit.dart';
import 'package:gradprojectstorio/features/profile/presentation/widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateMeCubit(
        profileRepo: ProfileRepoImpl(
          profileRemoteDataSource: ProfileRemoteDataSourceImpl(
            apiService: ApiService(Dio()),
          ),
        ),
      ),
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
