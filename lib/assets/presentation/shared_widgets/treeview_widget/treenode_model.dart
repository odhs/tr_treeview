enum NodeType {
  location,
  subLocation,
  asset,
  subAsset,
  component,
  freeComponent,
}

class TreeNodeModel {
  dynamic entity;
  NodeType nodeType;
  bool isCollapsed;
  List<TreeNodeModel> children;

  TreeNodeModel(
      {required this.entity,
      required this.nodeType,
      required this.isCollapsed,
      required this.children});

  TreeNodeModel.clone(TreeNodeModel tnm)
      : this(
            entity: tnm.entity,
            nodeType: tnm.nodeType,
            isCollapsed: tnm.isCollapsed,
            children: tnm.children);

  /*
  Location Types
  +--------------+----------+
  | Name         | ParentID |
  +--------------+----------+
  | Location     |   null   |
  | SubLocation  |    1     |
  +--------------+----------+
  */
  static NodeType getLocationType(String? parentID) {
    if (parentID != null) {
      return NodeType.subLocation;
    } else {
      return NodeType.location;
    }
  }

  /*
  Asset Types
  +--------------+------------+----------+------------+----------+
  | Name         | LocationID | ParentID | SensorType | SensorID |
  +--------------+------------+----------+------------+----------+
  | Asset        |     1      |   null   |    null    |   null   |
  | SubAsset     |    null    |    1     |    null    |   null   |
  | Component    |    null    |    1     |      1     |    1     |
  | FreeComponent|    null    |   null   |      1     |    1     |
  +--------------+------------+----------+------------+----------+
  */
  NodeType getAssetType(
      String? parentID, String? locationID, String? sensorType) {
    if (sensorType != null) {
      if (parentID != null || locationID != null) {
        return NodeType.component;
      } else {
        return NodeType.freeComponent;
      }
    } else {
      return NodeType.asset;
    }
  }
}
