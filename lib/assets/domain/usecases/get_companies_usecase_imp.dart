import 'package:tr_treeview/assets/domain/entities/company_entity.dart';
import 'package:tr_treeview/assets/domain/repositories/get_companies_repository.dart';
import 'package:tr_treeview/assets/domain/usecases/get_companies_usecase.dart';

class GetCompaniesUsecaseImp extends GetCompaniesUsecase {
  final GetCompaniesRepository _getCompaniesRepository;
  GetCompaniesUsecaseImp(this._getCompaniesRepository);

  @override
  Future<List<CompanyEntity>> call() async {
    return await _getCompaniesRepository();
  }
}
