import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/login/login_request.dart';
import '../../data/models/login/login_response.dart';
import '../../data/models/register/register_request.dart';
import '../../data/repositories/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  bool isSignup = false; // ✅ Track whether it's signup or login

  AuthCubit(this._authRepository) : super(AuthInitial());

  // 🔹 Login User
  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final response = await _authRepository.login(LoginRequest(email: email, password: password));
      isSignup = false; // ✅ It's a login
      emit(AuthSuccess(response.user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // 🔹 Register User
  Future<void> register(RegisterRequest request) async {
    emit(AuthLoading());
    try {
      final response = await _authRepository.register(request);
      print("✅ Register Success: ${response.user}"); // Debug print
      emit(AuthSuccess(response.user));
    } catch (e, stacktrace) {
      print("❌ Register Failed: $e"); // 🔥 Print full error message
      print(stacktrace); // 🔥 Print stack trace to find the issue
      emit(AuthFailure(e.toString()));
    }
  }


  // 🔹 Forgot Password
  Future<void> forgotPassword(String email) async {
    emit(AuthLoading());
    try {
      await _authRepository.forgotPassword(email);
      emit(AuthPasswordResetEmailSent());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // 🔹 Verify OTP
  Future<void> verifyOTP(String email, String otp) async {
    emit(AuthLoading());
    try {
      await _authRepository.verifyOTP(email, otp);
      emit(AuthOTPVerified());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // 🔹 Reset Password
  Future<void> resetPassword(String email, String newPassword, String otp) async {
    emit(AuthLoading());
    try {
      await _authRepository.resetPassword(email, newPassword, otp);
      emit(AuthPasswordResetSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}

// 🔹 Authentication States
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final dynamic user;
  AuthSuccess(this.user);
}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}

class AuthPasswordResetEmailSent extends AuthState {}

class AuthOTPVerified extends AuthState {}

class AuthPasswordResetSuccess extends AuthState {}
