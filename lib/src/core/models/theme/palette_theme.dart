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
