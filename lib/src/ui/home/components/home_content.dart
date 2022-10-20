import 'package:flutter/material.dart';

import 'page_view_content.dart';
import 'bottom_navigation_bar_item_content.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key? key,
    required this.controller,
    required this.setPageIndex,
    required this.onItemTapped,
    required this.pageIndex,
    required this.primaryColor,
    required this.accentColor,
  }) : super(key: key);

  final dynamic controller;
  final int pageIndex;
  final Function(int) setPageIndex;
  final Function(int) onItemTapped;
  final Color primaryColor;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageViewContent(
        controller: controller,
        setPageIndex: setPageIndex,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(14),
          ),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.2),
              offset: const Offset(0, -2),
              blurRadius: 1,
              spreadRadius: 0,
            )
          ],
          color: const Color(0xfcffffff),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(14.0),
            topRight: Radius.circular(14.0),
          ),
          child: BottomNavigationBarContent(
            primaryColor: primaryColor,
            accentColor: accentColor,
            onItemTapped: onItemTapped,
            pageIndex: pageIndex,
          ),
        ),
      ),
    );
  }
}
