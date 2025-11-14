import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/core/services/api_service.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:gradprojectstorio/features/profile/data/repos/profile_repo_impl.dart';
import 'package:gradprojectstorio/features/profile/presentation/manager/change_password_cubit/change_password_cubit.dart';
import 'package:gradprojectstorio/features/profile/presentation/widgets/change_password_view_body.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(
        profileRepo: ProfileRepoImpl(
          profileRemoteDataSource: ProfileRemoteDataSourceImpl(
            apiService: ApiService(Dio()),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Change Password', style: AppStyles.textSemiBold24),
          centerTitle: true,
        ),
        body: ChangePasswordViewBody(),
      ),
    );
  }
}
