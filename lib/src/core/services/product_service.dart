import 'package:dio/dio.dart';

class ProductService {
  ProductService( this.dio, {this.baseUrl});

  final Dio dio;
  final String? baseUrl;
}