import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../models/user/bamba_user.dart';
import '../models/theme/bamba_theme.dart';
import '../services/customer_service.dart';
import '../response/wrapped_response.dart';
import '../utils/utils.dart';

class CustomerRepository {
  static final Dio _dio = Dio();

  static final CustomerRepository _instance = CustomerRepository._internal();
  static CustomerRepository get instance => _instance;

  CustomerRepository._internal();

  factory CustomerRepository() {
    Utils.getOSInfo().then((value) {
      _dio.options.headers["X-App-Platform"] = value["platform"];
      _dio.options.headers["X-App-Build-Number"] = value["buildNumber"];
      _dio.options.headers["X-App-Version"] = value["version"];
      _dio.options.headers["Content-Type"] = 'application/json';
      _dio.options.headers["Accept"] = 'application/json';
      if (kIsWeb) {
        _dio.options.headers["Access-Control-Allow-Origin"] = '*';
      }
    });

    return _instance;
  }

  Future<BambaUser> getCustomer(String token, String customerId) async {
    return CustomerService(_dio).getCustomer(token, customerId: customerId);
  }

  Future<WrappedResponse> sendPin(String token, Map<String, dynamic> body) async {
    return CustomerService(_dio).sendPin(token, body: body);
  }

  Future<BambaUser> login(String token, Map<String, dynamic> body) async {
    return CustomerService(_dio).login(token, body: body);
  }

  Future<BambaTheme> getTheme(String channel) async {
    return CustomerService(_dio).getTheme(channel: channel);
  }
}
