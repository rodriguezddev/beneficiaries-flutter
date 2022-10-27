import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/theme/theme_bloc.dart';

class DrawerItem extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String title;
  final ImageProvider? image;

  const DrawerItem({
    Key? key,
    required this.title,
    required this.image,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState){
          return ListTile(
            title: Row(
              children: <Widget>[
                ImageIcon(
                  image,
                  size: 18,
                  color: themeState.primaryColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: themeState.textTitleColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            onTap: onTap,
          );
        }
    );
  }
}
