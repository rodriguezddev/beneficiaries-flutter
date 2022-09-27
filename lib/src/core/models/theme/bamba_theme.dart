import 'package:json_annotation/json_annotation.dart';

import 'palette_theme.dart';

@JsonSerializable()
class BambaTheme {
  @JsonKey(name: 'logo_url')
  String? logoUrl;

  @JsonKey(name: 'palette')
  Palette? palette;

  BambaTheme({
    this.palette,
    this.logoUrl
  });

  factory BambaTheme.fromJson(Map<String, dynamic> json) => BambaTheme(
    logoUrl: json['logo_url'] as String?,
    palette: json['palette'] == null
      ? null
      : Palette.fromJson(json['palette'] as Map<String, dynamic>),
    );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'logoUrl': logoUrl,
    'palette': palette,
  };
}
