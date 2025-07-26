import 'package:firebase_auth/firebase_auth.dart';
import 'package:reco_app/features/auth/domain/entities/entity.dart';

class FirebaseAuthDataSource {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthDataSource(this._firebaseAuth);

  Future<UserEntity?> signInWithEmail(String email, String password) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = result.user;
    if (user != null) {
      return UserEntity(uid: user.uid, email: user.email ?? "");
    }
    return null;
  }
}
