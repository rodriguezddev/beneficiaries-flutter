import 'package:dio/dio.dart';

class CustomerService {
  CustomerService( this.dio, {this.baseUrl});

  final Dio dio;
  final String? baseUrl;
}