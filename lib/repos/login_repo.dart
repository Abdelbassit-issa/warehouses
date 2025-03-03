

abstract class AuthRepo {
  Future<void> signinUserWithEmailAndPassword({required String email, required String password});
  Future<void> signinUserWithGoogle(dynamic googleCrdential);
  Future<void> signinUserWithFacebook(dynamic facebookCredential);
  Future<void> signupUserWithEmailAndPassword(String email, String password);
  Future<void> signupUserWithGoogle(dynamic googleCrdential);
  Future<void> signupUserWithFacebook(dynamic facebookCredential);
  Future<void> signOutUser();
}