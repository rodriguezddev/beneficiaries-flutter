import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class WrappedResponse {
  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "token")
  String? token;

  WrappedResponse();

   factory WrappedResponse.fromJson(Map<String, dynamic> json) =>
    WrappedResponse()
      ..message = json['message'] as String?
      ..token = json['token'] as String?;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'message': message,
    'token': token,
  };

}
