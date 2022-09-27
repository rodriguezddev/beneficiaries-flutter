part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class GetTheme extends ThemeEvent{
  GetTheme();
}
