import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tr_treeview/assets/domain/entities/asset_entity.dart';
import 'package:tr_treeview/assets/domain/entities/location_entity.dart';
import 'package:tr_treeview/assets/domain/usecases/get_assets_usecase.dart';
import 'package:tr_treeview/assets/domain/usecases/get_locations_usecase.dart';
import 'package:tr_treeview/assets/presentation/shared_widgets/treeview_widget/treenode_model.dart';

// Function to build the tree
List<TreeNodeModel> buildTree(Map<String, dynamic> entityMap) {
  List<TreeNodeModel>? root = [];

  // Recursive function to build the tree from a knot
  Future<TreeNodeModel> buildSubtree(dynamic entity) async {
    List<TreeNodeModel> children = [];

    NodeType type = NodeType.location;

    // Find child entities of the current node
    entityMap.forEach(
      (id, e) async {
        // Sub Location
        if (e is LocationEntity && e.parentId == entity.id) {
          children.add(await buildSubtree(e));
          // Asset, Sub location or Component
        } else {
          if ((e is AssetEntity && e.locationId == entity.id) ||
              (e is AssetEntity && e.parentId == entity.id)) {
            children.add(await buildSubtree(e));
          }
        }
      },
    );

    if (entity is AssetEntity) {
      type = TreeNodeModel.getAssetType(
          entity.locationId, entity.parentId, entity.sensorType);
    } else {
      type = TreeNodeModel.getLocationType(entity.parentId);
    }

    // Return a node with the current entity and its children
    return TreeNodeModel(
        entity: entity, nodeType: type, isCollapsed: true, children: children);
  }

  // Find the Locations and The Free Components
  entityMap.forEach((id, e) async {
    if (e is LocationEntity && e.parentId == null) {
      root.add(await buildSubtree(e));
    }
    if (e is AssetEntity && e.parentId == null && e.locationId == null) {
      root.add(await buildSubtree(e));
    }
  });

// TODO take out at the end of the project
  if (kDebugMode) {
    for (var child in root) {
      printTree(child);
    }
  }

  return root;
}

// Print the tree
// TODO take out at the end of the project
void printTree(TreeNodeModel node, {int level = 0}) {
  if (kDebugMode) {
    print('${'  ' * level}${node.entity.name} (${node.nodeType})');
    for (var child in node.children) {
      printTree(child, level: level + 1);
    }
  }
}

Widget _buildNode(TreeNodeModel node, {int level = 0}) {
  return ExpansionTile(
    key: PageStorageKey<String>(node.entity.id),
    onExpansionChanged: (bool expanded) {},
    controlAffinity: ListTileControlAffinity.leading,
    title: Text('${'  ' * level}${node.entity.name} (${node.nodeType})'),
    children: node.children.map((child) {
      return _buildNode(child, level: level + 1);
    }).toList(),
  );
}

class AssetsController extends GetxController {
  // Loading status
  bool _isloading = false;
  bool get isLoading => _isloading;

  // Data access to the repositories
  final getLocationsList = Get.find<GetLocationsUsecase>();
  final getAssetsList = Get.find<GetAssetsUsecase>();

  List<LocationEntity> locationList = [];
  List<AssetEntity> assetList = [];

  // To Merging Locations with Assets into a single list
  // TODO In the future consider receiving from the API already in a single class
  Map<String, dynamic> entityMap = <String, dynamic>{};

  List<Widget> treeWidget = [];
  List<TreeNodeModel> treeNodeList = [];

  // Pagination Control
  int pageIndex = 0;
  int currentPage = 0;

  AssetsController() {
    _init();
  }

  void _init() async {
    _isloading = true;
    update();

    // Getting the ID of the company from home_page button
    final companyID = Get.arguments;

    // Get The locations and subLocations
    locationList = await getLocationsList(companyID);
    // Get The Assets, Sub-Assets, Component and Free Components
    assetList = await getAssetsList(companyID);

    loadPageData(0);

    if (kDebugMode) {
      print('START content entityMap:');
      entityMap.forEach((key, value) {
        print('$key: $value');
      });
      print('END content entityMap');
    }

    if (kDebugMode) {
      for (var item in locationList) {
        if (item.parentId == null) {}
        print(item.toString());
      }
    }

    showTree();

    _isloading = false;
    update();
  }

  void nextPage() {
    loadPageData(currentPage + 1);
    showTree();
  }

  void previousPage() {
    if (currentPage > 0) {
      loadPageData(currentPage - 1);
    }
    showTree();
  }

  void showTree() {
    loadPageData(currentPage);
    treeNodeList = buildTree(entityMap);
    for (var child in treeNodeList) {
      treeWidget.add(_buildNode(child));
    }
  }

  void loadPageData(int pageIndex) async {
    // Page Size
    const int pageSize = 20;

    // Limit the loop to paginate
    int iterationCount = 0;
    int startIndex = pageIndex * pageSize;

    for (int i = startIndex; i < locationList.length; i++) {
      if (iterationCount >= pageSize) break;
      final locationEntity = locationList[i];
      entityMap[locationEntity.id] = locationEntity;
      iterationCount++;
    }
    /*
    for (final locationEntity in locationList) {
      entityMap[locationEntity.id] = locationEntity;
    }*/

    for (final assetEntity in assetList) {
      entityMap[assetEntity.id] = assetEntity;
    }
  }
}
