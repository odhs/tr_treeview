import 'package:tr_treeview/assets/domain/entities/company_entity.dart';

abstract class GetCompaniesRepository {
  Future<List<CompanyEntity>> call();
}
