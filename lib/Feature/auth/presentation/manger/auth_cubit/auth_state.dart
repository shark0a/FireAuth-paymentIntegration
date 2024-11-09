part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFAliuer extends AuthState {
  final String faliuer;

  AuthFAliuer({required this.faliuer});
}

class AuthPasswordVisibilityChanged extends AuthState {
  final bool isObscure;

  AuthPasswordVisibilityChanged(this.isObscure);
}
