import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:dio/dio.dart';

import '../constants/asset_constants.dart';
import '../models/user/bamba_user.dart';

class Utils {
  static SystemUiOverlayStyle darkSystemUiOverlayStyle() {
    return Platform.isAndroid
      ? const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFF000000),
        systemNavigationBarDividerColor: null,
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      )
      : SystemUiOverlayStyle.dark;
  }

  static SystemUiOverlayStyle lightSystemUiOverlayStyle() {
    return Platform.isAndroid
      ? const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFF000000),
        systemNavigationBarDividerColor: null,
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      )
      : SystemUiOverlayStyle.light;
  }

  static Future<Map<String, dynamic>> getOSInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    String platform = kIsWeb
        ? "Web"
        : Platform.isAndroid
            ? "android"
            : "ios";

    return {
      "version": version,
      "buildNumber": buildNumber,
      "platform": platform
    };
  }

  static Future saveUserPrefs(BambaUser user) async {
    // save user
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      'user',
      jsonEncode(
        user.toJson(),
      ),
    );
  }

  static Future<BambaUser?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userAsString = prefs.getString('user');
    if (userAsString != null) {
      Map<String, dynamic> userObject = json.decode(userAsString);
      return BambaUser.fromJson(userObject);
    }

    return null;
  }

  static Future savePointsPrefs(BambaUser user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    BambaUser? bambaUser = await getUser();

    if (bambaUser == null) {
      return;
    }

    bambaUser.bambaBalance = user.bambaBalance;
    prefs.setString(
      'user',
      jsonEncode(
        bambaUser.toJson(),
      ),
    );
  }

  static int getAge(DateTime birthday) {
    final today = DateTime.now();
    var years = today.year - birthday.year;
    final months = today.month - birthday.month;

    if (months < 0 || (months == 0 && today.isBefore(birthday))) {
      years--;
    }

    return years;
  }

  static DateTime? convertStringToDate(String date) {
    try {
      return DateTime.parse(date);
    } on FormatException catch (e) {
      return null;
    }
  }

  static void launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  /// Validate if the user has token
  static Future<bool> isLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    return token != null;
  }

  static Future saveToken(String token) async {
    // save user
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  static String getLocalizedDate(DateTime? dateTime) {
    if (dateTime == null) {
      return 'No date selected';
    }

    String year = dateTime.year.toString();
    String month = dateTime.month.toString().padLeft(2, '0');
    String day = dateTime.day.toString().padLeft(2, '0');

    return "$day-$month-$year";
  }

  static Future<Dio> getDio() async {
    Dio dio = Dio();

    final result = await Utils.getOSInfo();

    dio.options.headers["X-App-Platform"] = result["platform"];
    dio.options.headers["X-App-Build-Number"] = result["buildNumber"];
    dio.options.headers["X-App-Version"] = result["version"];
    dio.options.headers["Content-Type"] = 'application/json';
    dio.options.headers["Accept"] = 'application/json';
    if (kIsWeb) {
      dio.options.headers["Access-Control-Allow-Origin"] = '*';
    }

    return dio;
  }

  static String getToken() {
    return "qi7bfwP5We8bg205Ac3TL9oKPWVMtRQ953Fq1JlV";
  }

  static showSnackBar({
    required BuildContext context,
    required String message,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void onFocusScope(BuildContext context, newState) {
    if (newState.firstDigit.length == 1) {
      FocusScope.of(context).requestFocus(newState.secondTextFieldFocus);
    }
    if (newState.secondDigit.length == 1) {
      FocusScope.of(context).requestFocus(newState.thirdTextFieldFocus);
    }
    if (newState.thirdDigit.length == 1) {
      FocusScope.of(context).requestFocus(newState.fourthTextFieldFocus);
    }
  }

  static const bottomNavigationList = [
    ['Profile', AssetImage(AssetConstants.user)],
    ['Services', AssetImage(AssetConstants.verified)],
    ['Chat', AssetImage(AssetConstants.chat)],
  ];
}
