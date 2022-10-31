import 'package:flutter/material.dart';

import '../../core/constants/spacings.dart';
import '../../core/constants/asset_constants.dart';
import '../customer/profile_view.dart';
import '../drawer/navigation_drawer.dart';

class HomeWebView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomeWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavigationDrawer(),
      body: Stack(
        children: [
          //TODO: add correct view (myservices)
          const ProfileView(),
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
