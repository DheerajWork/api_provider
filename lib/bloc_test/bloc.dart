// import 'dart:convert';
// import 'package:api_provider/bloc_test/logic/state.dart';
// import 'package:bloc/bloc.dart';
//
// class AuthBloc extends Bloc<AuthEvent, MyState> {
//   final AuthRepository authRepository;
//   AuthBloc({required this.authRepository}) : super(AuthInitial()) {
//     on<RegisterEvent>((event, emit) async {
//       await registerApi(event, emit);
//     });
//   }
//
//   registerApi(RegisterEvent event, Emitter<AuthState> emit) async {
//     emit(RegisterLoadingState());
//
//     try {
//       ApiResponse apiResponse = await authRepository.register(
//           username: event.username,
//           email: event.email,
//           fcmToken: '',
//           fullName: event.fullName,
//           gender: event.gender);
//
//       if (apiResponse.response.statusCode == 200) {
//         BaseResponse base =
//         BaseResponse.fromJson(apiResponse.response.data['responseStatus']);
//
//         if (base.statusCode == "200") {
//           emit(OtpSendState(event.username));
//         } else {
//           emit(ErrorState(base.statusMessage!));
//         }
//       }
//     } on Exception catch (e) {
//       emit(ErrorState(e.toString()));
//     }
//   }
//
// }
