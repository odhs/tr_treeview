import 'package:tr_treeview/assets/domain/entities/company_entity.dart';

abstract class GetCompaniesUsecase {
  Future<List<CompanyEntity>> call();
}
