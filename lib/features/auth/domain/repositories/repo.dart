import 'package:reco_app/features/auth/domain/entities/entity.dart';

abstract class AuthRepo {
  Future<UserEntity?> signInWithEmail(String email, String password);
}