import 'dart:developer';
import 'package:routus_clean/components/children_filter/data/models/filter_child.dart';
import 'package:routus_clean/core/api_service.dart';

class ChildrenFilterRepository {
  Future<List<FilterChild>> fetchChildren() async {
    try {
      final jsonData = await ApiService().get(
        'students',
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
