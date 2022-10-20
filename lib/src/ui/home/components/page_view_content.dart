import 'package:flutter/material.dart';

import '../../customer/profile_view.dart';

class PageViewContent extends StatelessWidget {
  const PageViewContent({
    Key? key,
    required this.controller,
    required this.setPageIndex,
  }) : super(key: key);

  final dynamic controller;
  final Function(int) setPageIndex;

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      onPageChanged: (index) {
        setPageIndex(index);
      },
      children: const <Widget>[
        //TODO: add the corresponding views
        ProfileView(),
      ],
    );
  }
}
