import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/auth_model.dart';

class AuthService {
  static final client = Supabase.instance.client;

  static Future<AuthModel?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final id = response.user?.id;
      final userEmail = response.user?.email;

      if (id == null || userEmail == null) {
        return null;
      }

      return AuthModel.fromJson(id, userEmail);
    } on AuthException catch (e) {
      print("Auth error (signIn): ${e.message}");
      return null;
    } catch (e) {
      print("Unexpected error (signIn): $e");
      return null;
    }
  }

  static Future<AuthModel?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.auth.signUp(
        email: email,
        password: password,
      );

      final id = response.user?.id;
      final userEmail = response.user?.email;

      if (id == null || userEmail == null) {
        return null;
      }

      return AuthModel.fromJson(id, userEmail);
    } on AuthException catch (e) {
      print("Auth error (signUp): ${e.message}");
      return null;
    } catch (e) {
      print("Unexpected error (signUp): $e");
      return null;
    }
  }

  static Future<void> signOut() async {
    try {
      await client.auth.signOut();
    } on AuthException catch (e) {
      print("Auth error (signOut): ${e.message}");
    } catch (e) {
      print("Unexpected error (signOut): $e");
    }
  }
}
