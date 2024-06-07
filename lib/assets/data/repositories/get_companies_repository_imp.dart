import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:tr_treeview/assets/core/api_utils.dart';
import 'package:tr_treeview/assets/domain/entities/company_entity.dart';
import 'package:tr_treeview/assets/domain/repositories/get_companies_repository.dart';

class GetCompaniesRepositoryImp extends GetCompaniesRepository {
  @override
  Future<List<CompanyEntity>> call() async {
    List<CompanyEntity> list = [];

    final url = Uri.https(APIUtils.kApiBaseURL, APIUtils.getCompanies());

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      for (var item in json) {
        list.add(CompanyEntity.fromJson(item));
      }
    }
    return list;
  }
}
