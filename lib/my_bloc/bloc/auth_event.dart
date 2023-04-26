part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

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



class OtpVerifyEvent extends AuthEvent {
  final String? username;
  final String? otp;
  OtpVerifyEvent( {this.otp,this.username});

  @override
  List<Object> get props => [];
}
