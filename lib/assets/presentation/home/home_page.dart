import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tr_treeview/assets/core/design_system/tractian_colors.dart';
import 'package:tr_treeview/assets/presentation/home/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  _init() {}

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
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
