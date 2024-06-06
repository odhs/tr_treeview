import 'package:tr_treeview/assets/domain/entities/location_entity.dart';
import 'package:tr_treeview/assets/domain/repositories/get_locations_repository.dart';
import 'package:tr_treeview/assets/domain/usecases/get_locations_usecase.dart';

class GetLocationsUsecaseImp extends GetLocationsUsecase {
  final GetLocationsRepository _getLocationsRepository;

  GetLocationsUsecaseImp(this._getLocationsRepository);

  @override
  Future<List<LocationEntity>> call(String id) async {
    return await _getLocationsRepository(id);
  }
}
