// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

final class LoginState extends Equatable {
  const LoginState({
    required this.credentialState,
    required this.userProfileModel,
  });
  final UserCredentialsState credentialState;
  final UserProfileModel userProfileModel;

  factory LoginState.initial() => LoginState(
    credentialState: UserCredentialsState.invalidCredentials,
    userProfileModel: UserProfileModel(
      email: '',
      idNumber: '',
      name: '',
      phoneNumber: '',
      role: Role.initalUser,
      userID: '',
    ),
  );
  @override
  List<Object> get props => [credentialState, userProfileModel];

  LoginState copyWith({
    UserCredentialsState? credentialState,
    UserProfileModel? userProfileModel,
  }) {
    return LoginState(
      credentialState: credentialState ?? this.credentialState,
      userProfileModel: userProfileModel ?? this.userProfileModel,
    );
  }
}
