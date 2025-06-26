import 'dart:developer';
import 'package:routus_clean/components/children_filter/data/models/filter_child.dart';
import 'package:routus_clean/core/api_service.dart';

class ChildrenFilterRepository {
  Future<List<FilterChild>> fetchChildren() async {
    // final token = await PreferencesHelper().getToken();
    const token = '30|zYOqUgXUEe0AvUAZuBIjRQLacsQiL3pWHiREuJGWf389d431';
    // const token = '17|F6DqzgMLXPA1wpp30ZrJaPOINppixgLyX0iMUV3cabf7ea7c';

    try {
      log('Bearer $token');
      final jsonData = await ApiService().get(
        'students',
        headers: {'Authorization': 'Bearer $token'},
      );
      List<FilterChild> messages = [];
      jsonData.forEach((item) {
        messages.add(FilterChild.fromJson(item));
      });
      return messages;
    } catch (e) {
      throw Exception('Request Error');
    }
  }
}
