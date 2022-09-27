import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Palette {
  @JsonKey(name: 'primary')
  String? primaryColor;

  @JsonKey(name: 'secondary')
  String? secondaryColor;

  @JsonKey(name: 'accent')
  String? accentColor;

  @JsonKey(name: 'header_color')
  String? headerColor;

  @JsonKey(name: 'accent_controls')
  String? accentControls;

  @JsonKey(name: 'text_color')
  String? textColor;

  @JsonKey(name: 'text_title_color')
  String? textTitleColor;

  @JsonKey(name: 'text_subtitle_color')
  String? textSubTitleColor;

  Palette({
    this.primaryColor,
    this.secondaryColor,
    this.accentColor,
    this.headerColor,
    this.accentControls,
    this.textColor,
    this.textTitleColor,
    this.textSubTitleColor,
  });

  factory Palette.fromJson(Map<String, dynamic> json) =>
    Palette()
      ..primaryColor = json['primary'] as String?
      ..secondaryColor = json['secondary'] as String?
      ..accentColor = json['accent'] as String?
      ..headerColor = json['header_color'] as String?
      ..accentControls = json['accent_controls'] as String?
      ..textColor = json['text_color'] as String?
      ..textTitleColor = json['text_title_color'] as String?
      ..textSubTitleColor = json['text_subtitle_color'] as String?;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'primary': primaryColor,
    'secondary': secondaryColor,
    'accent': secondaryColor,
    'header_color': headerColor,
    'accent_controls': accentControls,
    'text_color': textColor,
    'text_title_color': textTitleColor,
    'text_subtitle_color': textSubTitleColor,
  };
}
