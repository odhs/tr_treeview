import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:tr_treeview/assets/core/api_utils.dart';
import 'package:tr_treeview/assets/domain/entities/location_entity.dart';
import 'package:tr_treeview/assets/domain/repositories/get_locations_repository.dart';

class GetLocationsRepositoryImp extends GetLocationsRepository {
  @override
  Future<List<LocationEntity>> call(String id) async {
    List<LocationEntity> list = [];

    final url = Uri.https(APIUtils.kApiBaseURL, APIUtils.getLocations(id));

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      for (var item in json) {
        list.add(LocationEntity.fromJson(item));
      }
    }
    return list;
  }
}
