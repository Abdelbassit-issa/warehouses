import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:warehouses/repos/connections/root_conn.dart';
import 'package:warehouses/repos/login/login_repo.dart';

class SigninUser implements AuthRepo {
  @override
  Future<void> signOutUser() async {
    Supabase.instance.client.auth.signOut();
  }

  @override
  Future<User?> signinUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final conn = RootConnection.getConnection();
      final response = await conn.supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.session != null) {
        return response.user!;
      } else {
        log("Login failed: No session found.");
      }
    } on AuthException catch (e) {
      // ignore: unrelated_type_equality_checks
      if (e.statusCode == 400 &&
          e.message.contains("Invalid login credentials")) {
        log("Login failed: Invalid email or password.");
      } else {
        log("Login failed: ${e.message}");
      }
    } catch (e) {
      log("Login failed: An unexpected error occurred - $e");
    }
    return null;
  }

  @override
  Future<void> signinUserWithFacebook(facebookCredential) {
    throw UnimplementedError();
  }

  @override
  Future<void> signinUserWithGoogle(googleCrdential) {
    throw UnimplementedError();
  }

  @override
  Future<void> signupUserWithEmailAndPassword(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<void> signupUserWithFacebook(facebookCredential) {
    throw UnimplementedError();
  }

  @override
  Future<void> signupUserWithGoogle(googleCrdential) {
    throw UnimplementedError();
  }
}
