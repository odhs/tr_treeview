import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tr_treeview/assets/core/design_system/tractian_colors.dart';
import 'package:tr_treeview/assets/presentation/assets_page/assets_controller.dart';
import 'package:tr_treeview/assets/presentation/shared_widgets/treeview_widget/treenode_widget.dart';

class AssetsPage extends StatelessWidget {
  const AssetsPage({super.key});

  CupertinoNavigationBar navigationBar() {
    return CupertinoNavigationBar(
      backgroundColor: TractianColors.shapesPlatformHeader,
      automaticallyImplyLeading: true,
      middle: Text(
        "Assets",
        style: TextStyle(
          color: TractianColors.neutralColorsWhite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: TractianColors.neutralColorsWhite,
      navigationBar: navigationBar(),
      child: GetBuilder(
        init: AssetsController(),
        builder: (controller) {
          return Center(
            child: controller.isLoading
                ? const CupertinoActivityIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ...List.generate(
                        controller.treeNodeList.length,
                        (int index) {
                          return TreeNode(
                            treeNodeModel: controller.treeNodeList[index],
                          );
                        },
                      )
                    ],
                  ),
          );
        },
      ),
    );
  }
}
