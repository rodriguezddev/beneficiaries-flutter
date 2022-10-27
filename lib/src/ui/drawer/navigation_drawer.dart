import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/spacings.dart';
import '../../core/constants/constants.dart';
import '../../core/bloc/theme/theme_bloc.dart';
import '../../core/constants/asset_constants.dart';
import 'components/drawer_item.dart';
import '../kommons/shared_widgets.dart';

import '../../core/constants/bamba_routes.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return Drawer(
          child: ListView(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
            ),
            children: [
              const SizedBox(
                height: Spacings.spacing02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    padding: const EdgeInsets.only(right: 18),
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close,
                      size: Spacings.spacing04,
                      color: themeState.primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              DrawerItem(
                image: const AssetImage(
                  AssetConstants.user,
                ),
                title: Constants.profileText,
                onTap: () => {
                  Navigator.pushReplacementNamed(
                    context,
                    BambaRoutes.profileWeb,
                  )
                },
              ),
              SharedWidgets.drawLineContainer(
                context,
                const EdgeInsets.symmetric(
                  vertical: 4,
                ),
              ),
              DrawerItem(
                image: const AssetImage(
                  AssetConstants.verified,
                ),
                title: Constants.serviceText,
                onTap: () => Navigator.pushReplacementNamed(
                  context,
                  BambaRoutes.home,
                ),
              ),
              SharedWidgets.drawLineContainer(
                context,
                const EdgeInsets.symmetric(
                  vertical: 4,
                ),
              ),
              DrawerItem(
                image: const AssetImage(
                  AssetConstants.chat,
                ),
                title: Constants.supportText,
                onTap: () => Navigator.pushReplacementNamed(
                  context,
                  BambaRoutes.chatWeb,
                ),
              ),
              SharedWidgets.drawLineContainer(
                context,
                const EdgeInsets.symmetric(
                  vertical: 4,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
