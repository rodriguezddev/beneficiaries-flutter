import 'package:json_annotation/json_annotation.dart';
import 'product_description.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: 'sku')
  String? sku;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'slug')
  String? slug;

  @JsonKey(name: 'price')
  double? price;

  @JsonKey(name: 'image')
  String? image;

  @JsonKey(name: 'brief')
  String? brief;

  @JsonKey(name: 'terms')
  String? terms;

  @JsonKey(name: "description")
  List<ProductDescription>? description;

  Product();

  factory Product.fromJson(Map<String, dynamic> json) => Product()
    ..sku = json['sku'] as String?
    ..name = json['name'] as String?
    ..slug = json['slug'] as String?
    ..price = (json['price'] as num?)?.toDouble()
    ..image = json['image'] as String?
    ..brief = json['brief'] as String?
    ..terms = json['terms'] as String?
    ..description = (json['description'] as List<dynamic>?)
        ?.map((e) => ProductDescription.fromJson(e as Map<String, dynamic>))
        .toList();

  Map<String, dynamic> toJson() => <String, dynamic>{
        'sku': sku,
        'name': name,
        'slug': slug,
        'price': price,
        'image': image,
        'brief': brief,
        'terms': terms,
        'description': description,
      };
}
