import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/login/login_request.dart';
import '../../data/models/login/login_response.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/models/register/register_request.dart';  // Import RegisterRequest

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(AuthInitial());

  // Login functionality
  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final response = await _authRepository.login(LoginRequest(email: email, password: password));
      emit(AuthSuccess(response)); // Pass LoginResponse to the success state
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // Register functionality
  Future<void> register(String firstName, String lastName, String email, String phone, String password, String confirmPassword) async {
    emit(AuthLoading());
    try {
      final response = await _authRepository.register(RegisterRequest(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        password: password,
        confirmPassword: confirmPassword,
      ));
      emit(AuthSuccess(response)); // Pass LoginResponse to the success state
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final LoginResponse response;

  AuthSuccess(this.response);
}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure(this.error);
}
