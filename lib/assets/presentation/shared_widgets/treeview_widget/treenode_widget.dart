import 'package:flutter/material.dart';
import 'package:tr_treeview/assets/core/design_system/tractian_colors.dart';
import 'package:tr_treeview/assets/presentation/shared_widgets/treeview_widget/treenode_model.dart';

class TreeNode extends StatefulWidget {
  final TreeNodeModel treeNodeModel;

  const TreeNode({
    super.key,
    required this.treeNodeModel,
  });

  @override
  State<TreeNode> createState() => _TreeNodeState();
}

// Inspired by widget ExpansionTile do Flutter
class _TreeNodeState extends State<TreeNode>
    with SingleTickerProviderStateMixin {
  bool _isCollapsed = false;
  late AnimationController _rotationController;
  final Tween<double> _turnsTween = Tween<double>(begin: -0.25, end: 0.0);

  double marginLeft = 7; // goo value = 14

  List<TreeNode> _generateTreeNodes(List<TreeNodeModel> list) {
    return List.generate(list.length, (int index) {
      return TreeNode(
        treeNodeModel: list[index],
      );
    });
  }

  Widget getLeadingIcon(NodeType nodeType) {
    String name = "";
    switch (nodeType) {
      case NodeType.location:
      case NodeType.subLocation:
        name = "assets/location.png";
      case NodeType.asset:
      case NodeType.subAsset:
        name = "assets/asset.png";
      case NodeType.component:
      case NodeType.freeComponent:
        name = "assets/component.png";
    }

    return name != ""
        ? Image.asset(
            name,
            width: 24,
            height: 24,
          )
        : const SizedBox.shrink();
  }

  Widget getComponentTrailingStatusIcon(TreeNodeModel tnm) {
    if (tnm.entity.status == "alert") {
      return Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(
          color: TractianColors.feedbackColorsDanger,
          shape: BoxShape.circle,
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget getComponentTrailingEnergyIcon(TreeNodeModel tnm) {
    if (tnm.entity.sensorType == "energy") {
      return Icon(
        Icons.bolt,
        color: TractianColors.feedbackColorsEnergized,
        size: 14.0,
      );
    }

    return const SizedBox.shrink();
  }

  Widget getGrid(bool isHorizontal) {
    const height = 14.0;
    const width = 14.0;
    Border gridBorder = isHorizontal
        ? Border(
            bottom: BorderSide(
              color:
                  TractianColors.neutralColorsGray200, // Cor da borda lateral
              width: 1.0,
            ),
          )
        : Border(
            left: BorderSide(
              color:
                  TractianColors.neutralColorsGray200, // Cor da borda lateral
              width: 1.0,
            ),
            bottom: BorderSide(
              color:
                  TractianColors.neutralColorsGray200, // Cor da borda lateral
              width: 1.0,
            ),
          );

    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 16.0,
            ),
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                border: gridBorder,
              ),
            )
          ],
        ),
        const Row(
          children: [
            SizedBox(
              height: height,
              width: width,
            )
          ],
        ),
      ],
    );
  }

  @override
  initState() {
    super.initState();

    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    if (_isCollapsed) {
      _rotationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onTap: () => toggleExpansion(),
          child: Container(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: marginLeft,
                ),

                // ARROW or GRID
                widget.treeNodeModel.children.isNotEmpty
                    ? RotationTransition(
                        turns: _turnsTween.animate(_rotationController),
                        child: const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Icon(
                            Icons.expand_more,
                            size: 16,
                          ),
                        ),
                      )
                    : widget.treeNodeModel.nodeType == NodeType.location ||
                            widget.treeNodeModel.nodeType == NodeType.asset ||
                            widget.treeNodeModel.nodeType ==
                                NodeType.subAsset ||
                            widget.treeNodeModel.nodeType ==
                                NodeType.freeComponent
                        ? const SizedBox(
                            width: 22.0,
                          )
                        : getGrid(false),

                getLeadingIcon(widget.treeNodeModel.nodeType),
                const SizedBox(
                  width: 4.0,
                ),

                // TITLE
                Flexible(
                  flex: 5,
                  fit: FlexFit.loose,
                  child: Text(
                    widget.treeNodeModel.entity.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                widget.treeNodeModel.nodeType == NodeType.component ||
                        widget.treeNodeModel.nodeType == NodeType.freeComponent
                    ? getComponentTrailingStatusIcon(widget.treeNodeModel)
                    : const SizedBox.shrink(),

                widget.treeNodeModel.nodeType == NodeType.component ||
                        widget.treeNodeModel.nodeType == NodeType.freeComponent
                    ? getComponentTrailingEnergyIcon(widget.treeNodeModel)
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),

        // CHILDREN
        widget.treeNodeModel.children != []
            ? SizeTransition(
                sizeFactor: _rotationController,
                child: Container(
                  decoration: widget.treeNodeModel.nodeType ==
                              NodeType.location ||
                          widget.treeNodeModel.nodeType == NodeType.subLocation
                      ? BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: TractianColors
                                  .neutralColorsGray200, // Cor da borda lateral
                              width: 1.0,
                              // Largura da borda lateral
                            ),
                          ),
                        )
                      : null,
                  margin: EdgeInsets.only(
                    left: marginLeft + 10,
                    bottom: widget.treeNodeModel.nodeType == NodeType.location
                        ? 10.0
                        : 0.0,
                  ),
                  child: Column(
                    children: _generateTreeNodes(widget.treeNodeModel.children),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  // Animation from ExpansionTile Flutter Widget
  void toggleExpansion() {
    _isCollapsed = !_isCollapsed;
    if (_isCollapsed) {
      _rotationController.forward();
    } else {
      _rotationController.reverse();
    }
    setState(() {});
  }
}
