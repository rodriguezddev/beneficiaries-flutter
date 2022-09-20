import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../constants/api_constants.dart';
import '../models/theme/bamba_theme.dart';
import '../models/user/bamba_user.dart';
import '../response/wrapped_response.dart';

part 'customer_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CustomerService {
  factory CustomerService(Dio dio, {String baseUrl}) = _CustomerService;

  @GET('customer/{customerId}')
  Future<BambaUser> getCustomer(
    @Header("x-api-key") String token, {
    @Header("Content-Type") String contentType = 'application/json',
    @Path() required String customerId,
  });

  @POST('auth/send-pin')
  Future<WrappedResponse> sendPin(
    @Header("x-api-key") String token, {
    @Header("Content-Type") String contentType = 'application/json',
    @Body() required Map<String, dynamic> body,
  });

  @PUT('auth/login')
  Future<BambaUser> login(
    @Header("x-api-key") String token, {
    @Header("Content-Type") String contentType = 'application/json',
    @Body() required Map<String, dynamic> body,
  });

  @GET('theme/{channel}')
  Future<BambaTheme> getTheme({
    @Header("Content-Type") String contentType = 'application/json',
    @Path() required String channel,
  });
}