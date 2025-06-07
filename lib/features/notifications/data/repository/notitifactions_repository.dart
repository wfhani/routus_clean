import 'dart:developer';
import 'package:routus_clean/core/api_service.dart';
import 'package:routus_clean/core/preferences_helper.dart';
import 'package:routus_clean/features/notifications/data/models/notifcations_response.dart';

class NotificationsRepository {
  Future<NotificationsResponse> fetchNotifications() async {
    // final token = await PreferencesHelper().getToken();
    const token = '30|zYOqUgXUEe0AvUAZuBIjRQLacsQiL3pWHiREuJGWf389d431';

    try {
      log('Bearer $token');
      final jsonData = await ApiService().get(
        'notifications/student/242502',
        // headers: {'Authorization': 'Bearer $token'},
      );
      return NotificationsResponse.fromJson(jsonData);
    } catch (e) {
      throw Exception('Request Error');
    }
  }
}
