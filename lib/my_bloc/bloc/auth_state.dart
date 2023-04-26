part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class OtpLoadingState extends AuthState {}

class OtpSendState extends AuthState {
  final String? username;
  const OtpSendState(this.username);
  @override
  List<Object> get props => [username!];
}

class VerificationCompleteState extends AuthState {}

class ErrorState extends AuthState {
  final String error;
  const ErrorState(this.error);

  @override
  List<Object> get props => [error];
}
