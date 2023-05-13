import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
            label: 'Settings',
            icon: CustomItemIcon(
              iconSize: 0.03,
              imageAssetIcon: 'assets/images/setting.png',
              backgroundItemColor: Color(0xFFF9F9F9),
            ),
          ),
        ]);
  }
}

class CustomItemIcon extends StatelessWidget {
  final String? imageAssetIcon;
  final double iconSize;
  final Color? backgroundItemColor;
  final IconData? icon;
  final double? padding;
  final Color? iconColor;
  const CustomItemIcon({
    super.key,
    this.imageAssetIcon,
    required this.iconSize,
    this.backgroundItemColor,
    this.icon,
    this.padding,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? 9.0),
      decoration: BoxDecoration(
          color: backgroundItemColor ?? const Color.fromARGB(0, 255, 255, 255),
          borderRadius: BorderRadius.circular(30)),
      child: imageAssetIcon != null
          ? Image.asset(
              imageAssetIcon!,
              height: MediaQuery.of(context).size.height * iconSize,
            )
          : Icon(
              icon ?? Icons.check,
              color: iconColor ?? Colors.black,
            ),
    );
  }
}
