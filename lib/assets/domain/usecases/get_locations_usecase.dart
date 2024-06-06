import 'package:tr_treeview/assets/domain/entities/location_entity.dart';

abstract class GetLocationsUsecase {
  Future<List<LocationEntity>> call(String id);
}
