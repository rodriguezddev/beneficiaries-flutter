// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ProductService implements ProductService {
  _ProductService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://staging.api.vivebamba.com/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Product>> getProducts(token,
      {contentType = 'application/json'}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'x-api-key': token,
      r'Content-Type': contentType
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Product>>(Options(
                method: 'GET',
                headers: _headers,
                extra: _extra,
                contentType: contentType)
            .compose(_dio.options, 'store/products',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Product.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<OrderResponse> buy(token,
      {contentType = 'application/json', required body}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'x-api-key': token,
      r'Content-Type': contentType
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<OrderResponse>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: contentType)
            .compose(_dio.options, 'store/orders',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OrderResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<BambaService>> getServices(token,
      {contentType = 'application/json', required customerId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'x-api-key': token,
      r'Content-Type': contentType
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<BambaService>>(Options(
                method: 'GET',
                headers: _headers,
                extra: _extra,
                contentType: contentType)
            .compose(_dio.options, 'customer/${customerId}/services',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => BambaService.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<BambaService> removeService(token,
      {contentType = 'application/json',
      required customerId,
      required serviceId,
      required body}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'x-api-key': token,
      r'Content-Type': contentType
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BambaService>(Options(
                method: 'PUT',
                headers: _headers,
                extra: _extra,
                contentType: contentType)
            .compose(_dio.options,
                'customer/${customerId}/services/${serviceId}/cancel',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BambaService.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
