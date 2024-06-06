class LocationEntity {
  final String id;
  final String name;
  final String? parentId;

  const LocationEntity({
    required this.id,
    required this.name,
    required this.parentId,
  });

  factory LocationEntity.fromJson(Map<String, dynamic> json) => LocationEntity(
        id: json['id'],
        name: json['name'],
        parentId: json['parentId'],
      );

  @override
  String toString() => 'LocationEntity(id: $id, name: $name, parentId: $parentId)';
}
