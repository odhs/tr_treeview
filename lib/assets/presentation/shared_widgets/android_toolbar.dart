import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tr_treeview/assets/core/design_system/tractian_colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: TractianColors.shapesPlatformHeader,
        statusBarIconBrightness: Brightness.light, // For Android (light icons)
        statusBarBrightness: Brightness.dark, // For iOS (light icons)
      ),
      centerTitle: true,
      title: Image.asset(
        'assets/tractian_logo.png',
        fit: BoxFit.fitHeight,
        height: 17,
      ),
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: TractianColors.shapesPlatformHeader,
      foregroundColor: TractianColors.neutralColorsWhite,
    );
  }
}
