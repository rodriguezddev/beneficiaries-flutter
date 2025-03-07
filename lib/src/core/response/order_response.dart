import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class OrderResponse {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'state')
  String? state;

  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  OrderResponse();

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
    OrderResponse()
      ..id = json['id'] as String?
      ..state = json['state'] as String?
      ..createdAt = DateTime.parse(json['created_at'] as String)
      ..updatedAt = DateTime.parse(json['updated_at'] as String);

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'state': state,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };
}
