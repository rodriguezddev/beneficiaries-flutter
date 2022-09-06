import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsUtils {

  static logEvent({required String name, Map<String, dynamic>? params}) {
    final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

    analytics.logEvent(name: name, parameters: params);
  }
}
