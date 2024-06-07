import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import 'package:tr_treeview/assets/core/design_system/tractian_colors.dart';
import 'package:tr_treeview/assets/presentation/home_page/home_controller.dart';
import 'package:tr_treeview/assets/presentation/shared_widgets/home_toolbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const HomeAppBar(),
      backgroundColor: TractianColors.neutralColorsWhite,
      child: GetBuilder(
        init: HomeController(),
        builder: (controller) {
          return Center(
            child: controller.isLoading
                ? const CupertinoActivityIndicator()
                : ListView(
                    padding: const EdgeInsets.only(top: 8.0),
                    children: const [],
                  ),
          );
        },
      ),
    );
  }
}
