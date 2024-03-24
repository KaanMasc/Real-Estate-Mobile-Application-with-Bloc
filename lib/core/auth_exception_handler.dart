import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseAuthExceptionExtension on FirebaseAuthException {
  String getErrorMessage(e) {
    switch (e.code) {
      case 'wrong_password':
        return 'Incorrect password.';
      case 'user-not-found':
        return 'User not found with this email.';

      default:
        return "An undefined error occurred.";
    }
  }
}
