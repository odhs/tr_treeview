import 'package:tr_treeview/assets/domain/entities/asset_entity.dart';
import 'package:tr_treeview/assets/domain/repositories/get_assets_repository.dart';
import 'package:tr_treeview/assets/domain/usecases/get_assets_usecase.dart';

class GetAssetsUsecaseImp extends GetAssetsUsecase {
  final GetAssetsRepository _getAssetsRepository;
  GetAssetsUsecaseImp(this._getAssetsRepository);

  @override
  Future<List<AssetEntity>> call(id) async {
    return await _getAssetsRepository(id);
  }
}
