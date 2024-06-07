import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:tr_treeview/assets/core/api_utils.dart';
import 'package:tr_treeview/assets/domain/entities/asset_entity.dart';
import 'package:tr_treeview/assets/domain/repositories/get_assets_repository.dart';

class GetAssetsRepositoryImp extends GetAssetsRepository {
  @override
  Future<List<AssetEntity>> call(String id) async {
    List<AssetEntity> list = [];

    final url = Uri.https(APIUtils.kApiBaseURL, APIUtils.getAssets(id));

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      for (var item in json) {
        list.add(AssetEntity.fromJson(item));
      }
    }
    return list;
  }
}
