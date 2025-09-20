import '../models/auth_model.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  AuthModel? user;
  AuthSuccess({required this.user});
}

final class AuthFailed extends AuthState {
  AuthModel? user;
  AuthFailed({required this.user});
}

final class AuthLoggedOut extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {
  AuthModel? user;
  RegisterSuccess({required this.user});
}

final class RegisterFailed extends AuthState {
  AuthModel? user;
  RegisterFailed({required this.user});
}

final class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
