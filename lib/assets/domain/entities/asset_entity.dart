// Consider using the Equatable package in the future

class AssetEntity {
  final String id;
  final String name;
  final String? parentId;
  final String? sensorId;
  final String? sensorType;
  final String? status;
  final String? gatewayId;
  final String? locationId;

  const AssetEntity({
    required this.id,
    required this.name,
    required this.parentId,
    required this.sensorId,
    required this.sensorType,
    required this.status,
    required this.gatewayId,
    required this.locationId,
  });

  factory AssetEntity.fromJson(Map<String, dynamic> json) => AssetEntity(
        id: json["id"],
        name: json["name"],
        parentId: json["parentId"],
        sensorId: json["sensorId"],
        sensorType: json["sensorType"],
        status: json["status"],
        gatewayId: json["gatewayId"],
        locationId: json["locationId"],
      );

  @override
  String toString() {
    return 'AssetEntity(id: $id, name: $name, parentId: $parentId, sensorId: $sensorId, sensorType: $sensorType, status: $status, gatewayId: $gatewayId, locationId: $locationId)';
  }
}
