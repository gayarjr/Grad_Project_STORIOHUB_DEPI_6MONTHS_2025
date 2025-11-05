import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      validateStatus: (status) => status! < 500, // Don't throw on 4xx errors
    ),
  );

  Future<void> userRegister({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {
    emit(RegisterLoadingState());

    try {
      Response response = await dio.post(
        'https://ecommerce.routemisr.com/api/v1/auth/signup',
        data: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone,
        },
      );
      // Check if the response is successful
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data['message'] == 'success') {
          emit(RegisterSuccessState());
        } else {
          // API returned 200 but with an error message
          String errorMessage =
              response.data['message'] ?? 'Registration failed';
          emit(RegisterErrorState(errorMessage));
        }
      } else {
        // Handle 4xx errors
        String errorMessage = _extractErrorMessage(response.data);
        emit(RegisterErrorState(errorMessage));
      }
    } on DioException catch (dioError) {
      String errorMessage = _handleDioError(dioError);
      emit(RegisterErrorState(errorMessage));
    } catch (error) {
      String errorMessage = "Unexpected error: ${error.toString()}";
      emit(RegisterErrorState(errorMessage));
    }
  }

  String _extractErrorMessage(dynamic responseData) {
    if (responseData == null) return "Unknown error occurred";

    // Try to extract message from response
    if (responseData is Map) {
      // Check for message field
      if (responseData['message'] != null) {
        return responseData['message'].toString();
      }

      // Check for errors field (validation errors)
      if (responseData['errors'] != null) {
        if (responseData['errors'] is Map) {
          Map errors = responseData['errors'];
          String errorMsg = "";
          errors.forEach((key, value) {
            if (value is List && value.isNotEmpty) {
              errorMsg += "${value[0]}\n";
            }
          });
          return errorMsg.trim().isNotEmpty
              ? errorMsg.trim()
              : "Validation failed";
        } else if (responseData['errors'] is String) {
          return responseData['errors'];
        }
      }

      // Check for error field
      if (responseData['error'] != null) {
        return responseData['error'].toString();
      }
    }

    return "Registration failed. Please try again.";
  }

  String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return "Connection timeout. Please check your internet connection.";

      case DioExceptionType.badResponse:
        if (error.response?.data != null) {
          return _extractErrorMessage(error.response!.data);
        }
        return "Server error: ${error.response?.statusCode}";

      case DioExceptionType.connectionError:
        return "No internet connection. Please check your network.";

      case DioExceptionType.cancel:
        return "Request was cancelled.";

      default:
        return error.message ?? "Network error occurred.";
    }
  }
}
