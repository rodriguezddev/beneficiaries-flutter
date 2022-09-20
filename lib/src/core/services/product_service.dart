import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../response/order_response.dart';
import '../constants/api_constants.dart';
import '../models/products/product.dart';
import '../models/services/bamba_service.dart';

part 'product_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ProductService {
  factory ProductService(Dio dio, {String baseUrl}) = _ProductService;

  @GET('store/products')
  Future<List<Product>> getProducts(
    @Header("x-api-key") String token, {
    @Header("Content-Type") String contentType = 'application/json',
  });

  @POST('store/orders')
  Future<OrderResponse> buy(
    @Header("x-api-key") String token, {
    @Header("Content-Type") String contentType = 'application/json',
    @Body() required Map<String, dynamic> body,
  });

  @GET('customer/{customerId}/services')
  Future<List<BambaService>> getServices(
    @Header("x-api-key") String token, {
    @Header("Content-Type") String contentType = 'application/json',
    @Path() required String customerId,
  });

  @PUT('customer/{customerId}/services/{serviceId}/cancel')
  Future<BambaService> removeService(
    @Header("x-api-key") String token, {
    @Header("Content-Type") String contentType = 'application/json',
    @Path() required String customerId,
    @Path() required String serviceId,
    @Body() required Map<String, dynamic> body
  });
}
