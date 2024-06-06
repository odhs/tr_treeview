import 'package:tr_treeview/assets/domain/entities/asset_entity.dart';

abstract class GetAssetsRepository {
  Future<List<AssetEntity>> call(String id);
}
