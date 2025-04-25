import 'package:dio/dio.dart';
import '../models/absence_model.dart';

class AbsenceRepository {
  final Dio _dio = Dio();
  final String baseUrl = 'https://peaceful-alien-indirectly.ngrok-free.app/api/absences';

  Future<List<Absence>> fetchAbsences(int studentId) async {
    final response = await _dio.get(
      '$baseUrl/$studentId',
      options: Options(validateStatus: (status) => status != null && status < 500),
    );

    print("📥 API GET Response: ${response.data}");

    if (response.statusCode == 404 || response.data is! Map || !response.data.containsKey('absences')) {
      print("⚠️ No absences found, returning empty list");
      return [];
    }

    final data = response.data['absences'] as List<dynamic>;
    final result = data.map((e) => Absence.fromJson(e)).toList();
    print("✅ Mapped Absences: $result");

    return result;
  }

  Future<void> addAbsences(List<Absence> absences) async {
    if (absences.isEmpty) return;

    final payload = {
      'student_id': absences.first.studentId,
      'dates': absences.map((e) => e.date.toIso8601String().split('T').first).toList(),
    };

    print('📤 POST Payload: $payload');
    final response = await _dio.post(baseUrl, data: payload);
    print("📥 POST Response: ${response.statusCode} -> ${response.data}");
  }

  Future<void> deleteAbsence(int studentId, int dateId) async {
    final url = '$baseUrl/$studentId';
    print("🗑️ Sending DELETE to: $url with ID: $dateId");

    try {
      final response = await _dio.delete(
        url,
        data: {"absence_id": dateId},
        options: Options(validateStatus: (status) => status != null && status < 500),
      );

      print("📥 DELETE Response: ${response.statusCode} -> ${response.data}");

      if (response.statusCode == 404) {
        throw Exception("Failed to delete: ${response.statusCode} ${response.data}");
      }
    } catch (e) {
      print("❌ DELETE error: $e");
      rethrow;
    }
  }

  Future<void> editAbsences(int studentId, List<DateTime> selectedDates) async {
    final formattedDates = selectedDates.map((d) => d.toIso8601String().split('T').first).toList();

    final payload = {
      'student_id': studentId,
      'dates': formattedDates,
    };

    final url = '$baseUrl/$studentId/update-date';
    print("📤 Sending PUT to: $url with body: $payload");

    final response = await _dio.put(url, data: payload);
    print("📥 EDIT Response: ${response.statusCode} -> ${response.data}");
  }
}
