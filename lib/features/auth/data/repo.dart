import 'package:reco_app/features/auth/data/datasource.dart';
import 'package:reco_app/features/auth/domain/entities/entity.dart';
import 'package:reco_app/features/auth/domain/repositories/repo.dart';

class AuthRepositoryImpl implements AuthRepo {
  final FirebaseAuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<UserEntity?> signInWithEmail(String email, String password) {
    return dataSource.signInWithEmail(email, password);
  }
}