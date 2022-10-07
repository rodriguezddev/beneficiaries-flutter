import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../core/bloc/theme/theme_bloc.dart';
import '../../core/constants/asset_constants.dart';
import '../../core/constants/api_constants.dart';
import '../../core/utils/utils.dart';

class ChatWebView extends StatefulWidget {
  const ChatWebView({Key? key}) : super(key: key);

  @override
  ChatWebViewState createState() => ChatWebViewState();
}

class ChatWebViewState extends State<ChatWebView> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget loading = isLoading
      ? SizedBox(
        height: 550,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
          ],
        ),
      )
      : Container();

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: ((context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 45),
                  child: Image.asset(
                    AssetConstants.logo,
                    height: 20,
                  ),
                )
              ],
            ),
            iconTheme: IconThemeData(
              color: state.primaryColor,
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: Utils.darkSystemUiOverlayStyle(),
            child: Column(
              children: <Widget>[
                Container(
                  child: loading,
                ),
                Expanded(
                  child: SizedBox(
                    width: width,
                    child: WebView(
                      initialUrl: ApiConstants.chatBaseUrl,
                      javascriptMode: JavascriptMode.unrestricted,
                      onPageStarted: (url) {
                        setState(
                          () {
                            isLoading = true;
                          },
                        );
                      },
                      onPageFinished: (url) {
                        setState(
                          () {
                            isLoading = false;
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
