import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tr_treeview/assets/core/design_system/tractian_colors.dart';
import 'package:tr_treeview/assets/presentation/assets_page/assets_controller.dart';
import 'package:tr_treeview/assets/presentation/shared_widgets/toggle_buttons.dart';
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
                      toolBar(),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.only(top: 16.0),
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
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }

  Widget toolBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: TractianColors.neutralColorsGray200, // Cor da borda lateral
            width: 1.0,
            // Largura da borda lateral
          ),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 34.0,
            child: CupertinoSearchTextField(
              borderRadius: BorderRadius.circular(4.0),
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: TractianColors.neutralColorsGray500,
              ),
              keyboardType: TextInputType.text,
              style: const TextStyle(fontSize: 15.0),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          const TractianToggleButtons(
            buttonData: [
              {'icon': CupertinoIcons.bolt, 'label': 'Sensor de Energia'},
              {'icon': CupertinoIcons.info_circle_fill, 'label': 'Crítico'},
            ],
          )
        ],
      ),
    );
  }
}
