import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BambaUser {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'lastName')
  String? lastName;

  @JsonKey(name: 'secondLastName')
  String? secondLastName;

  @JsonKey(name: 'cellphone')
  String? cellphone;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'birthdate')
  DateTime? birthdate;

  @JsonKey(name: 'gender')
  String? gender;

  @JsonKey(name: 'bambaBalance')
  String? bambaBalance;

  @JsonKey(name: "token")
  String? token;

  BambaUser();

  factory BambaUser.fromJson(Map<String, dynamic> json) => BambaUser()
    ..id = json['id'] as String?
    ..name = json['name'] as String?
    ..lastName = json['lastName'] as String?
    ..secondLastName = json['secondLastName'] as String?
    ..cellphone = json['cellphone'] as String?
    ..email = json['email'] as String?
    ..birthdate = json['birthdate'] == null
      ? null
      : DateTime.parse(json['birthdate'] as String)
    ..gender = json['gender'] as String?
    ..bambaBalance = json['bambaBalance'] as String?
    ..token = json['token'] as String?;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'lastName': lastName,
    'secondLastName': secondLastName,
    'cellphone': cellphone,
    'email': email,
    'birthdate': birthdate?.toIso8601String(),
    'gender': gender,
    'bambaBalance': bambaBalance,
    'token': token,
  };
}
