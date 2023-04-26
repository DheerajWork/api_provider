part of 'auth_bloc.dart';

abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String username;
  final String fullName;
  final String email;
  final String gender;
  final String fcmToken;
  RegisterEvent(this.fullName, this.email, this.gender, this.fcmToken, this.username);

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String? username;
  LoginEvent({this.username});

  @override
  List<Object> get props => [];
}