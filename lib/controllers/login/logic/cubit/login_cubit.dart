import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warehouses/controllers/login/logic/login_user.dart';

import '../../../../constants/emuns.dart';
import '../../../../repos/connections/root_conn.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  void login(String email, String password) async {
    try {
      emit(
        state.copyWith(
          credentialState: UserCredentialsState.loadingCredentials,
        ),
      );
      final SigninUser loginMethod = SigninUser();
      final user = await loginMethod.signinUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user != null) {
        Map<String, dynamic> userData = await _getUserDetails(user.id);
        // final userProfile = UserProfileModel.fromMap(userData);
        emit(
          state.copyWith(
            credentialState: UserCredentialsState.userLoggedIn,
            userProfileModel: userData,
          ),
        );
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<Map<String, dynamic>> _getUserDetails(String userId) async {
    final supabase = RootConnection.getConnection();

    // Fetch role from Supabase based on user id
    final response =
        await supabase.supabaseClient
            .from('profiles')
            .select('*')
            .eq('id', userId)
            .single();

    return response;
  }
}
