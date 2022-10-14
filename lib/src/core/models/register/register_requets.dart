import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SendPinRequest {
  @JsonKey(name: 'cellphone')
  String? cellphone;

  SendPinRequest({
    this.cellphone,
  });

  factory SendPinRequest.fromJson(Map<String, dynamic> json) =>
    SendPinRequest()
      ..cellphone = json['cellphone'] as String?;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'cellphone': cellphone,
  };
}
