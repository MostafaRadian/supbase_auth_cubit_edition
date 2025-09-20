import 'package:bloc/bloc.dart';

import '../services/auth_services.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signUp({required String email, required String password}) async {
    emit(RegisterLoading());
    final data = await AuthService.signUp(email: email, password: password);
    if (data != null) {
      emit(RegisterSuccess(user: data));
    } else {
      emit(RegisterFailed(user: data));
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(AuthLoading());
    final data = await AuthService.signIn(email: email, password: password);
    if (data != null) {
      emit(AuthSuccess(user: data));
    } else {
      emit(AuthFailed(user: data));
    }
  }

  Future<void> signOut() async {
    await AuthService.signOut();
    emit(AuthLoggedOut());
  }
}
