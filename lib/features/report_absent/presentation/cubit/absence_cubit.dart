import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/absence_model.dart';
import '../../data/repository/absence_repository.dart';

DateTime normalizeDate(DateTime dt) => DateTime(dt.year, dt.month, dt.day);

abstract class AbsenceState {}

class AbsenceInitial extends AbsenceState {}

class AbsenceLoading extends AbsenceState {}

class AbsenceLoaded extends AbsenceState {
  final List<Absence> absences;
  AbsenceLoaded(this.absences);
}

class AbsenceError extends AbsenceState {
  final String message;
  AbsenceError(this.message);
}

class AbsenceCubit extends Cubit<AbsenceState> {
  final AbsenceRepository repo;
  AbsenceCubit(this.repo) : super(AbsenceInitial());

  Future<void> loadAbsences(int studentId) async {
    try {
      emit(AbsenceLoading());
      final result = await repo.fetchAbsences(studentId);
      emit(AbsenceLoaded(result));
    } catch (e) {
      emit(AbsenceError("Failed to load absences: ${e.toString()}"));
    }
  }

  // ❌ DO NOT TOUCH — SAVE LOGIC
  Future<void> submitAbsences(List<DateTime> selectedDates, int studentId) async {
    try {
      emit(AbsenceLoading());

      final selectedNormalized = selectedDates.map(normalizeDate).toSet();
      final existingAbsences = await repo.fetchAbsences(studentId);
      final existingDatesMap = {
        for (var a in existingAbsences) normalizeDate(a.date): a.id,
      };

      final existingDates = existingDatesMap.keys.toSet();
      final toDelete = existingDates.difference(selectedNormalized);
      final toAdd = selectedNormalized.difference(existingDates);

      for (final date in toDelete) {
        final id = existingDatesMap[date];
        if (id != null) {
          await repo.deleteAbsence(studentId, id);
          print("🗑️ Deleted absence for $date (ID $id)");
          await Future.delayed(Duration(milliseconds: 400));
        }
      }

      if (toAdd.isNotEmpty) {
        final newAbsences = toAdd
            .map((date) => Absence(id: 0, studentId: studentId, date: date))
            .toList();

        await repo.addAbsences(newAbsences);
        print("➕ Added new dates: $toAdd");
        await Future.delayed(Duration(seconds: 2));
      }

      final refreshed = await repo.fetchAbsences(studentId);
      print("🔁 Final refreshed absences: $refreshed");
      emit(AbsenceLoaded(refreshed));
    } catch (e) {
      emit(AbsenceError("Failed to submit absences: ${e.toString()}"));
    }
  }

  Future<void> deleteAbsence(int absenceId, int studentId) async {
    try {
      emit(AbsenceLoading());
      await repo.deleteAbsence(studentId, absenceId);
      final updated = await repo.fetchAbsences(studentId);
      print("🗑️ Absence deleted. Reloaded list: $updated");
      emit(AbsenceLoaded(updated));
    } catch (e) {
      emit(AbsenceError("Failed to delete absence: ${e.toString()}"));
    }
  }

  Future<void> editAbsences(List<DateTime> selectedDates, int studentId) async {
    try {
      emit(AbsenceLoading());

      final selectedNormalized = selectedDates.map(normalizeDate).toSet();
      final existingAbsences = await repo.fetchAbsences(studentId);
      final existingDatesMap = {
        for (var a in existingAbsences) normalizeDate(a.date): a.id,
      };

      final existingIds = existingAbsences.map((a) => a.id).toList();

      for (final id in existingIds) {
        try {
          print("🗑️ Deleting absence with ID: $id for student $studentId");
          await repo.deleteAbsence(studentId, id);
          print("✅ Deleted absence ID $id");
          await Future.delayed(const Duration(milliseconds: 300));
        } catch (e) {
          print("⚠️ Skipping failed delete for ID $id: $e");
        }
      }

      if (selectedNormalized.isNotEmpty) {
        final newAbsences = selectedNormalized.map(
              (date) => Absence(id: 0, studentId: studentId, date: date),
        ).toList();

        await repo.addAbsences(newAbsences);
        print("➕ Re-added dates: $selectedNormalized");
      }

      final refreshed = await repo.fetchAbsences(studentId);
      print("🔁 Final refreshed absences: $refreshed");
      emit(AbsenceLoaded(refreshed));
    } catch (e) {
      emit(AbsenceError("Failed to edit absences: ${e.toString()}"));
    }
  }

}
