part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginbuttonPressed extends LoginEvent {
  final String deviceToken;
  final String deviceType;

  LoginbuttonPressed({required this.deviceToken, required this.deviceType});
}
