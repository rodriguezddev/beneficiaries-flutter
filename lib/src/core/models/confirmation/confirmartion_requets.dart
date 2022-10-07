import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class PinValidatorRequest {
  @JsonKey(name: 'cellphone')
  String? cellphone;

  @JsonKey(name: 'pin')
  String? pin;

  PinValidatorRequest({
    this.cellphone,
    this.pin,
  });

  factory PinValidatorRequest.fromJson(Map<String, dynamic> json) =>
      PinValidatorRequest()
      ..cellphone = json['cellphone'] as String?
      ..pin = json['pin'] as String?;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'cellphone': cellphone,
    'pin': pin
  };
}
