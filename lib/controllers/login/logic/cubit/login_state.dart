// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

final class LoginState extends Equatable {
  const LoginState({
    required this.credentialState,
    required this.userProfileModel,
  });
  final UserCredentialsState credentialState;
  final Map<String ,dynamic> userProfileModel;

  factory LoginState.initial() => LoginState(
    credentialState: UserCredentialsState.invalidCredentials,
    userProfileModel: {}
  );
  @override
  List<Object> get props => [credentialState, userProfileModel];

  LoginState copyWith({
    UserCredentialsState? credentialState,
    Map<String ,dynamic>? userProfileModel,
  }) {
    return LoginState(
      credentialState: credentialState ?? this.credentialState,
      userProfileModel: userProfileModel ?? this.userProfileModel,
    );
  }
}
