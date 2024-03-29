import 'package:client_it/feature/auth/domain/auth_repository.dart';
import 'package:client_it/feature/auth/domain/entities/user_entity/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthState.notAuthorized());

  final AuthRepository authRepository;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(AuthState.waiting());
    try {
      final UserEntity userEntity =
          await authRepository.signIn(password: password, email: email);
      emit(AuthState.authorized(userEntity));
    } catch (e) {
      emit(AuthState.error(e));
      rethrow;
    }
  }

  Future<void> signUp({
    required String email,
    required String username,
    required String password,
  }) async {
    emit(AuthState.waiting());
    try {
      final UserEntity userEntity = await authRepository.signUp(
          password: password, username: username, email: email);
      emit(AuthState.authorized(userEntity));
    } catch (e) {
      emit(AuthState.error(e));
      rethrow;
    }
  }
}
