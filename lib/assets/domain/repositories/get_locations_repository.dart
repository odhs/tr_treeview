import 'package:tr_treeview/assets/domain/entities/location_entity.dart';

abstract class GetLocationsRepository {
  Future<List<LocationEntity>> call(String id);
}
