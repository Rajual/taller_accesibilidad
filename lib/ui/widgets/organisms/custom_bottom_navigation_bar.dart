import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../atoms/custom_item_icon.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      sortKey: const OrdinalSortKey(double.maxFinite),
      focusable: true,
      child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 15.0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 3.0,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: CustomItemIcon(
                iconSize: 0.025,
                imageAssetIcon: 'assets/images/home.png',
                backgroundItemColor: Color(0xFFF9F9F9),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Ticket',
              icon: CustomItemIcon(
                iconSize: 0.025,
                imageAssetIcon: 'assets/images/ticket.png',
                backgroundItemColor: Color(0xFFF9F9F9),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Carrito',
              icon: CustomItemIcon(
                iconSize: 0.035,
                imageAssetIcon: 'assets/images/carrito.png',
                backgroundItemColor: Color(0xFFF4AA4A),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Favoritos',
              icon: CustomItemIcon(
                iconSize: 0.033,
                imageAssetIcon: 'assets/images/favorites.png',
                backgroundItemColor: Color(0xFFF9F9F9),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Ajustes',
              icon: CustomItemIcon(
                iconSize: 0.03,
                imageAssetIcon: 'assets/images/setting.png',
                backgroundItemColor: Color(0xFFF9F9F9),
              ),
            ),
          ]),
    );
  }
}
