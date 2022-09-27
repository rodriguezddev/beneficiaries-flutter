part of 'theme_bloc.dart';

class ThemeState extends Equatable{
  final BaseStatus status;
  final String onErrorMessage;
  final BambaTheme? bambaTheme;
  final Color? accentColor;
  final Color? accentControls;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? headerColor;
  final Color? textTitleColor;
  final Color? textColor;
  final Color? textSubTitleColor;
  final String? logo;

  const ThemeState({
    this.status = BaseStatus.initialized,
    this.onErrorMessage = '',
    this.bambaTheme ,
    this.accentColor = ColorPalette.accent,
    this.accentControls = ColorPalette.green,
    this.primaryColor = ColorPalette.dark,
    this.secondaryColor = ColorPalette.accent,
    this.headerColor =ColorPalette.headerColor,
    this.textTitleColor = ColorPalette.cultured80,
    this.textColor = ColorPalette.dark,
    this.textSubTitleColor = ColorPalette.grayText1,
    this.logo,
  });

  ThemeState copyWith({
    BaseStatus? status,
    String? onErrorMessage,
    BambaTheme? bambaTheme,
    Color? accentColor,
    Color? accentControls,
    Color? primaryColor,
    Color? secondaryColor,
    Color? headerColor,
    Color? textTitleColor ,
    Color? textColor,
    Color? textSubTitleColor,
    String? logo,
  }) { 
    return ThemeState(
      status: status ?? this.status,
      onErrorMessage: onErrorMessage ?? this.onErrorMessage,
      bambaTheme: bambaTheme ?? this.bambaTheme,
      accentColor: accentColor ?? this.accentColor,
      accentControls: accentControls ?? this.accentControls,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      headerColor: headerColor ?? this.headerColor,
      textTitleColor: textTitleColor ?? this.textTitleColor,
      textColor: textColor ?? this.textColor,
      textSubTitleColor: textSubTitleColor ?? this.textSubTitleColor,
      logo: logo ?? this.logo,
    );
  }

  @override
  List<Object?> get props => [
    status,
    onErrorMessage,
    bambaTheme,
    accentColor,
    accentControls,
    primaryColor,
    secondaryColor,
    headerColor,
    textTitleColor,
    textColor,
    textSubTitleColor,
  ];
}
