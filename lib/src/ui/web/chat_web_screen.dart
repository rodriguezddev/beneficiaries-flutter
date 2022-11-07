import 'package:flutter/material.dart';

import '../../core/constants/asset_constants.dart';
import '../../core/constants/spacings.dart';
import '../chat/chat_view.dart';
import '../drawer/navigation_drawer.dart';

class ChatWebScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ChatWebScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavigationDrawer(),
      body: Stack(
        children: [
          const ChatView(),
          Positioned(
            top: Spacings.spacing02,
            left: 0,
            child: IconButton(
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              icon: const ImageIcon(
                AssetImage(AssetConstants.menu),
                size: 24,
              ),
            ),
          )
        ],
      ),
    );
  }
}
