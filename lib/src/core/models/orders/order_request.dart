import 'package:json_annotation/json_annotation.dart';

import '../products/product.dart';
import 'order.dart';


@JsonSerializable()
class OrderRequest {
  @JsonKey(name: 'customerId')
  String? customerId;

  @JsonKey(name: 'paymentParams')
  PaymentParams? paymentParams;

  @JsonKey(name: 'products')
  List<Product>? products;

  OrderRequest();

  factory OrderRequest.fromJson(Map<String, dynamic> json) =>
    OrderRequest()
      ..customerId = json['customerId'] as String?
      ..paymentParams = json['paymentParams'] as PaymentParams?
      ..products =
        (json['products'] as List<dynamic>?)?.map((e) => e as Product).toList();

  Map<String, dynamic> toJson() => <String, dynamic>{
    'customerId': customerId,
    'paymentParams': paymentParams,
    'products': products,
  };
}
