import 'package:flutter/foundation.dart';

class ApiConstants {
  static String get baseUrl {
    if (kDebugMode) {
      // 🖥️ Local development (your laptop and your friend's laptop)
      return 'http://192.168.1.30:8000'; // ✅ TEMP for you — your friend will change their local IP too
    } else {
      // 🌐 Production server (when deployed)
      return 'https://your-production-server.com'; // 🔥 Set this when live
    }
  }
}
