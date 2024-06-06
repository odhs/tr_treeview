class CompanyEntity {
  final String id;
  final String name;

  const CompanyEntity({
    required this.id,
    required this.name,
  });

// To follow Clean Architecture to the letter, this section should be placed in a DTO (Data Transfer Object)
// Using the Dart class "extension" "on"
  factory CompanyEntity.fromJson(Map<String, dynamic> json) => CompanyEntity(
        id: json['id'],
        name: json['name'],
      );

  @override
  String toString() => 'CompanyEntity(id: $id, name: $name)';
}
