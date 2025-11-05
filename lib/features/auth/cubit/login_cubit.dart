import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  Dio dio = Dio();

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    try {
      Response response = await dio.post(
        'https://ecommerce.routemisr.com/api/v1/auth/signin',
        data: {"email": email, "password": password},
      );

      String token = response.data["token"];

      emit(LoginSuccessState(token));
    } catch (error) {
      String errorMessage = "Something went wrong";

      if (error is DioException) {
        errorMessage = error.response?.data['message'] ?? error.message!;
      }
      emit(LoginErrorState(errorMessage));
    }
  }
}
