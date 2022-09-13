import 'package:json_annotation/json_annotation.dart';

import '../products/product.dart';


@JsonSerializable()
class Order {
  @JsonKey(name: 'customerId')
  String? customerId;

  @JsonKey(name: 'paymentParams')
  PaymentParams? paymentParams;

  @JsonKey(name: 'products')
  List<Product>? products;

  Order();

  factory Order.fromJson(Map<String, dynamic> json) =>
    Order()
      ..customerId = json['customerId'] as String?
      ..paymentParams = json['paymentParams'] as PaymentParams?
      ..products = (json['products'] as List<Product>?)
        ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList();

  Map<String, dynamic> toJson() => <String, dynamic>{
    'customerId': customerId,
    'paymentParams': paymentParams,
    'products': products,
  };
}

@JsonSerializable()
class PaymentParams {
  @JsonKey(name: 'mediaTypeKey')
  String? mediaTypeKey;

  @JsonKey(name: 'mediaTypeValue')
  String? mediaTypeValue;

  PaymentParams();

  factory PaymentParams.fromJson(Map<String, dynamic> json) =>
    PaymentParams()
      ..mediaTypeKey = json['mediaTypeKey'] as String?
      ..mediaTypeValue = json['mediaTypeValue'] as String?;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'mediaTypeKey': mediaTypeKey,
    'mediaTypeValue': mediaTypeValue,
  };
}
