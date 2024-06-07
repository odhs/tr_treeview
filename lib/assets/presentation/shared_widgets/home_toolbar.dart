import 'package:flutter/cupertino.dart';

import 'package:tr_treeview/assets/core/design_system/tractian_colors.dart';

class HomeAppBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize =>
      const Size.fromHeight(kMinInteractiveDimensionCupertino);

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Image.asset(
        'assets/tractian_logo.png',
        fit: BoxFit.fitHeight,
        height: 17,
      ),
      automaticallyImplyLeading: false,
      backgroundColor: TractianColors.shapesPlatformHeader,
    );
  }

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}
