import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';

class PageViewContent extends StatelessWidget {
  const PageViewContent({
    Key? key,
    required this.pageIndex
  }) : super(key: key);

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Utils.widgetOptions.elementAt(pageIndex),
    );
  }
}
