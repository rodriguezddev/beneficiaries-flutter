import 'package:json_annotation/json_annotation.dart';

import '../products/product.dart';
import '../products/product_description.dart';

@JsonSerializable()
class BambaService extends Product {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'sku')
  String? sku;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'image')
  String? image;

  @JsonKey(name: 'brief')
  String? brief;

  @JsonKey(name: 'state')
  String? state;

  @JsonKey(name: 'validFrom')
  DateTime? validFrom;

  @JsonKey(name: 'validTo')
  DateTime? validTo;

  @JsonKey(name: 'canceledAt')
  DateTime? canceledAt;

  @JsonKey(name: 'certificate_link')
  String? certificateLink;

  @override
  @JsonKey(name: "description")
  List<ProductDescription>? description;

  @JsonKey(name: 'products')
  List<Product>? products;

  @JsonKey(ignore: true)
  bool fromBundle = false;

  BambaService();

  factory BambaService.fromJson(Map<String, dynamic> json) => BambaService()
    ..slug = json['slug'] as String?
    ..price = (json['price'] as num?)?.toDouble()
    ..terms = json['terms'] as String?
    ..id = json['id'] as String?
    ..sku = json['sku'] as String?
    ..name = json['name'] as String?
    ..image = json['image'] as String?
    ..brief = json['brief'] as String?
    ..state = json['state'] as String?
    ..validFrom = json['validFrom'] == null
      ? null
      : DateTime.parse(json['validFrom'] as String)
    ..validTo = json['validTo'] == null
      ? null
      : DateTime.parse(json['validTo'] as String)
    ..canceledAt = json['canceledAt'] == null
      ? null
      : DateTime.parse(json['canceledAt'] as String)
    ..certificateLink = json['certificate_link'] as String?
    ..description = (json['description'] as List<dynamic>?)
      ?.map((e) => ProductDescription.fromJson(e as Map<String, dynamic>))
      .toList()
    ..products = (json['products'] as List<dynamic>?)
      ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
      .toList();

  Map<String, dynamic> toJson() => <String, dynamic>{
    'slug': slug,
    'price': price,
    'terms': terms,
    'id': id,
    'sku': sku,
    'name': name,
    'image': image,
    'brief': brief,
    'state': state,
    'validFrom': validFrom?.toIso8601String(),
    'validTo': validTo?.toIso8601String(),
    'canceledAt': canceledAt?.toIso8601String(),
    'certificate_link': certificateLink,
    'description': description,
    'products': products,
  };
}
