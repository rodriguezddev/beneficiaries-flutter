import 'package:flutter/material.dart';

import 'indicator.dart';

class BuildPageIndicatorContent extends StatelessWidget {
  const BuildPageIndicatorContent({
    Key? key,
    required this.numPages,
    required this.currentPage,
  }) : super(key: key);

  final int numPages;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildPageIndicator(),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < numPages; i++) {
      list.add(
        i == currentPage
          ? const IndicatorContent(
              isActive: true,
            )
          : const IndicatorContent(
              isActive: false,
            ),
      );
    }
    return list;
  }
}
