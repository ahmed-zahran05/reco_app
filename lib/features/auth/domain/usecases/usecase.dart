import 'package:reco_app/features/auth/domain/entities/entity.dart';
import 'package:reco_app/features/auth/domain/repositories/repo.dart';

class SignInUseCase {
  final AuthRepo repository;

  SignInUseCase(this.repository);

  Future<UserEntity?> call(String email, String password) {
    return repository.signInWithEmail(email, password);
  }
}