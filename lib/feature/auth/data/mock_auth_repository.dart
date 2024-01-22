import 'package:client_it/feature/auth/domain/auth_repository.dart';
import 'package:client_it/feature/auth/domain/entities/user_entity/user_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
@test
class MockAuthRepository implements AuthRepository {
  @override
  Future fetchUser() {
    // TODO: implement fetchUser
    throw UnimplementedError();
  }

  @override
  Future passwordUpdate(
      {required String oldPassword, required String newPassword}) {
    // TODO: implement passwordUpdate
    throw UnimplementedError();
  }

  @override
  Future refreshToken({required String refreshToken}) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future signIn({required String password, required String email}) {
    return Future.delayed(const Duration(seconds: 2), () {
      return UserEntity(
        email: email,
        username: "testUsername",
        id: "-1",
      );
    });
  }

  @override
  Future signUp(
      {required String password,
      required String username,
      required String email}) {
    return Future.delayed(const Duration(seconds: 2), () {
      return UserEntity(
        email: email,
        username: username,
        id: "-1",
      );
    });
  }

  @override
  Future updateUser({String? username, String? email}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
