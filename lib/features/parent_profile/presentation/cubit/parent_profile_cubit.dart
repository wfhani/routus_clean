// lib/features/parent_profile/presentation/cubit/parent_profile_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/parent_profile_model.dart';
import '../../data/repositories/parent_profile_repository.dart';

part 'parent_profile_state.dart';

class ParentProfileCubit extends Cubit<ParentProfileState> {
  final ParentProfileRepository repository;

  ParentProfileCubit(this.repository) : super(ParentProfileInitial());

  // ✅ Fetch Profile Method
  Future<void> fetchProfile(String email) async {
    emit(ParentProfileLoading());
    try {
      print("🚀 Fetching Profile for $email...");
      final profile = await repository.fetchParentProfile(email);
      print("✅ Profile Loaded: ${profile.firstName}, ${profile.email}");
      emit(ParentProfileLoaded(profile));
    } catch (e) {
      emit(ParentProfileError("Failed to load profile: $e"));
    }
  }
}
