part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoader extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});
}
