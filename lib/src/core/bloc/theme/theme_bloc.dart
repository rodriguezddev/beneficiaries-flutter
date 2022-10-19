import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/asset_constants.dart';
import '../../constants/color_palette.dart';
import '../../constants/constants.dart';
import '../../models/theme/bamba_theme.dart';
import '../../utils/base_status.dart';
import '../../utils/string_to_color.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<GetTheme>(_mapGetThemeEventToState);
  }

  Future<void> _mapGetThemeEventToState(
    GetTheme event,
    Emitter<ThemeState> emit,
  ) async {
    try {
      final dataLoaded = await _loadJsonData();
      final themeLoaded = BambaTheme.fromJson(dataLoaded);

      emit(
        state.copyWith(
          bambaTheme: themeLoaded,
          accentColor: StringToColor.fromString(
            themeLoaded.palette!.accentColor.toString(),
          ),
          accentControls: StringToColor.fromString(
            themeLoaded.palette!.accentControls.toString(),
          ),
          primaryColor: StringToColor.fromString(
            themeLoaded.palette!.primaryColor.toString(),
          ),
          secondaryColor: StringToColor.fromString(
            themeLoaded.palette!.secondaryColor.toString(),
          ),
          headerColor: StringToColor.fromString(
            themeLoaded.palette!.headerColor.toString(),
          ),
          textTitleColor: StringToColor.fromString(
            themeLoaded.palette!.textTitleColor.toString(),
          ),
          textColor: StringToColor.fromString(
            themeLoaded.palette!.textColor.toString(),
          ),
          textSubTitleColor: StringToColor.fromString(
            themeLoaded.palette!.textSubTitleColor.toString(),
          ),
          logo: themeLoaded.logoUrl,
        ),
      );
    } on DioError catch (error) {
      String message = _onDioError(error);

      emit(
        state.copyWith(
          status: BaseStatus.failed,
          onErrorMessage: message,
        ),
      );
    } catch (error) {
      String onErrorMessage = Constants.fileErrorText;

      emit(
        state.copyWith(
          status: BaseStatus.failed,
          onErrorMessage: onErrorMessage,
        ),
      );
    }
  }

  Future<Map<String, dynamic>> _loadJsonData() async {
    final jsonText = await rootBundle.loadString(AssetConstants.themeJson);
    final valueDecoded = json.decode(jsonText);

    return valueDecoded as Map<String, dynamic>;
  }

  String _onDioError(DioError error) {
    String errorMessage = '';

    switch (error.response?.statusCode) {
      case 400:
      case 401:
        errorMessage = error.response!.data[Constants.errorText];
        break;
      case 422:
        errorMessage = error.response!.data[Constants.fileErrorText];
        break;
      default:
        errorMessage = error.message;
        break;
    }

    return errorMessage;
  }
}
