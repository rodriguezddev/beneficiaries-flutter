import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';

class BottomNavigationBarContent extends StatelessWidget {
  const BottomNavigationBarContent({
    Key? key,
    required this.primaryColor,
    required this.accentColor,
    required this.onItemTapped,
    required this.pageIndex,
}) : super(key: key);

  final Color primaryColor;
  final Color accentColor;
  final int pageIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 0,
      unselectedFontSize: 0,
      backgroundColor: Colors.white,
      selectedItemColor: accentColor,
      unselectedItemColor: primaryColor,
      showSelectedLabels: false,
      items: [
        for (final tab in Utils.bottomNavigationList)
          BottomNavigationBarItem(
            icon: ImageIcon(
              tab[1] as AssetImage,
              size: 24,
            ),
            label: "",
          )
      ],
      currentIndex: pageIndex,
      onTap: (index) {
        onItemTapped(index);
      },
    );
  }
}
