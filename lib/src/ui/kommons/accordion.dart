import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shared_widgets.dart';
import '../../core/bloc/theme/theme_bloc.dart';

class Accordion extends StatelessWidget {
  const Accordion({
    Key? key,
    required this.title,
    this.content,
    this.subtitle,
    this.colorIcon,
    this.textColor,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final Color? colorIcon;
  final Color? textColor;
  final List? content;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: ((context, state) {
        return Column(
          children: [
            ExpansionTile(
              collapsedIconColor: colorIcon ?? state.accentColor,
              iconColor: colorIcon ?? state.accentColor,
              title: Text(
                title,
                style: TextStyle(
                  color: textColor ?? state.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: subtitle != null
                ? Text(
                    subtitle!,
                    style: TextStyle(
                      color: textColor ?? state.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      height: 1.3,
                    ),
                  ) 
                : null,
              children: <Widget>[
                if (content != null && content!.isNotEmpty)
                  for (var body in content!)
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 18.0,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SharedWidgets.buildPoint(state.primaryColor),
                            Flexible(
                              child: Container(
                                child: SharedWidgets.buildPointText(
                                  body,
                                  state.textColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
              ],
            ),
            SharedWidgets.drawLineContainer(
              context,
              const EdgeInsets.symmetric(vertical: 0),
            )
          ],
        );
      }),
    );
  }
}
