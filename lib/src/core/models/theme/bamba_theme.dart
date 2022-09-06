import 'package:json_annotation/json_annotation.dart';

import 'palette_theme.dart';

@JsonSerializable()
class BambaTheme extends Palette {
  @JsonKey(name: 'logo_url')
  String? logoUrl;

  @JsonKey(name: 'palette')
  Palette? palette;

  BambaTheme();

  factory BambaTheme.fromJson(Map<String, dynamic> json) => BambaTheme()
    ..logoUrl = json['logoUrl'] as String?
    ..palette = json['palette'] as Palette?;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'logoUrl': logoUrl,
    'palette': palette,
  };
}
