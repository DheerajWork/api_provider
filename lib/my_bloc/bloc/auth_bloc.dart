import 'dart:convert';
import 'package:api_provider/my_bloc/base_respo.dart';
import 'package:api_provider/my_bloc/api_repsonse.dart';
import 'package:api_provider/my_bloc/repos/data/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      await loginApi(event, emit);
    });
    on<RegisterEvent>((event, emit) async {
      await registerApi(event, emit);
    });
    on<OtpVerifyEvent>((event, emit) async {
      await verifyOtp(event, emit);
    });
  }

  loginApi(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());

    try {
      ApiResponse apiResponse =
          await authRepository.login(username: event.username);

      if (apiResponse.response.statusCode == 202) {
        BaseResponse base =
            BaseResponse.fromJson(apiResponse.response.data['responseStatus']);

        if (base.statusCode == "200") {
          emit(OtpSendState(event.username));
        } else {
          emit(ErrorState(base.statusMessage!));
        }
      }
    } on Exception catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  registerApi(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());

    try {
      ApiResponse apiResponse = await authRepository.register(
          username: event.username,
          email: event.email,
          fcmToken: '',
          fullName: event.fullName,
          gender: event.gender);

      if (apiResponse.response.statusCode == 200) {
        BaseResponse base =
            BaseResponse.fromJson(apiResponse.response.data['responseStatus']);

        if (base.statusCode == "200") {
          emit(OtpSendState(event.username));
        } else {
          emit(ErrorState(base.statusMessage!));
        }
      }
    } on Exception catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  verifyOtp(OtpVerifyEvent event, Emitter<AuthState> emit) async {
    emit(OtpLoadingState());

    try {
      ApiResponse apiResponse = await authRepository.verifyOtp(
          username: event.username, otp: event.otp);

      if (apiResponse.response.statusCode == 200) {
        BaseResponse base =
            BaseResponse.fromJson(apiResponse.response.data['responseStatus']);
        emit(VerificationCompleteState());
      } else {
        BaseResponse base =
            BaseResponse.fromJson(apiResponse.response.data['responseStatus']);
        emit(ErrorState(base.statusMessage!));
      }
    } on Exception catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
