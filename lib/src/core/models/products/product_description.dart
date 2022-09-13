import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ProductDescription {
  @JsonKey(name: 'section')
  String? section;

  @JsonKey(name: 'body')
  List<String>? body;

  ProductDescription();

  factory ProductDescription.fromJson(Map<String, dynamic> json) =>
    ProductDescription()
      ..section = json['section'] as String?
      ..body =
        (json['body'] as List<dynamic>?)?.map((e) => e as String).toList();

  Map<String, dynamic> toJson() => <String, dynamic>{
    'section': section,
    'body': body,
  };
}
