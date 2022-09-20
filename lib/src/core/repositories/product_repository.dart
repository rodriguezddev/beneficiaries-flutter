import 'package:dio/dio.dart';

import '../models/products/product.dart';
import '../models/services/bamba_service.dart';
import '../response/order_response.dart';
import '../services/product_service.dart';
import '../utils/utils.dart';

class ProductRepository {
  static final Dio _dio = Dio();

  static final ProductRepository _instance = ProductRepository._internal();
  static ProductRepository get instance => _instance;

  ProductRepository._internal();

  factory ProductRepository() {
    Utils.getOSInfo().then((value) {
      _dio.options.headers["X-App-Platform"] = value["platform"];
      _dio.options.headers["X-App-Build-Number"] = value["buildNumber"];
      _dio.options.headers["X-App-Version"] = value["version"];
      _dio.options.headers["Content-Type"] = 'application/json';
      _dio.options.headers["From"] = 'bamba-testing';
    });

    return _instance;
  }

  Future<List<Product>> getProducts({required String token}) async {
    return ProductService(_dio).getProducts(token);
  }

  Future<OrderResponse> buy(
      {required String token, required Map<String, dynamic> order} ) async {
    return ProductService(_dio).buy(token, body: order);
  }

  Future<List<BambaService>> getServices(
      {required String customerId, required String token}) async {
    return ProductService(_dio).getServices(token, customerId: customerId);
  }

  Future<BambaService> cancelService(
      {required String customerId,
      required String serviceId,
      required String token,
      required Map<String, dynamic> body
      }) async {
    return ProductService(_dio)
        .removeService(token, customerId: customerId, serviceId: serviceId, body: body);
  }
}
