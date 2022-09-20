// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _CustomerService implements CustomerService {
  _CustomerService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://staging.api.vivebamba.com/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BambaUser> getCustomer(token,
      {contentType = 'application/json', required customerId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'x-api-key': token,
      r'Content-Type': contentType
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BambaUser>(Options(
                method: 'GET',
                headers: _headers,
                extra: _extra,
                contentType: contentType)
            .compose(_dio.options, 'customer/${customerId}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BambaUser.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WrappedResponse> sendPin(token,
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
        _setStreamType<WrappedResponse>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: contentType)
            .compose(_dio.options, 'auth/send-pin',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WrappedResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BambaUser> login(token,
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
        _setStreamType<BambaUser>(Options(
                method: 'PUT',
                headers: _headers,
                extra: _extra,
                contentType: contentType)
            .compose(_dio.options, 'auth/login',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BambaUser.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BambaTheme> getTheme(
      {contentType = 'application/json', required channel}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Content-Type': contentType};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BambaTheme>(Options(
                method: 'GET',
                headers: _headers,
                extra: _extra,
                contentType: contentType)
            .compose(_dio.options, 'theme/${channel}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BambaTheme.fromJson(_result.data!);
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
