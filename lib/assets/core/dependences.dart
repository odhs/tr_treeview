import 'package:get/get.dart';

import 'package:tr_treeview/assets/data/repositories/get_assets_repository_imp.dart';
import 'package:tr_treeview/assets/data/repositories/get_locations_repository_imp.dart';
import 'package:tr_treeview/assets/data/repositories/get_companies_repository_imp.dart';

import 'package:tr_treeview/assets/domain/repositories/get_assets_repository.dart';
import 'package:tr_treeview/assets/domain/repositories/get_locations_repository.dart';
import 'package:tr_treeview/assets/domain/repositories/get_companies_repository.dart';

import 'package:tr_treeview/assets/domain/usecases/get_assets_usecase.dart';
import 'package:tr_treeview/assets/domain/usecases/get_assets_usecase_imp.dart';

import 'package:tr_treeview/assets/domain/usecases/get_companies_usecase.dart';
import 'package:tr_treeview/assets/domain/usecases/get_companies_usecase_imp.dart';

import 'package:tr_treeview/assets/domain/usecases/get_locations_usecase.dart';
import 'package:tr_treeview/assets/domain/usecases/get_locations_usecase_imp.dart';

class Dependencies {
  static init() {
    Get.put<GetCompaniesRepository>(GetCompaniesRepositoryImp());
    Get.put<GetLocationsRepository>(GetLocationsRepositoryImp());
    Get.put<GetAssetsRepository>(GetAssetsRepositoryImp());

    Get.put<GetCompaniesUsecase>(GetCompaniesUsecaseImp(Get.find()));
    Get.put<GetLocationsUsecase>(GetLocationsUsecaseImp(Get.find()));
    Get.put<GetAssetsUsecase>(GetAssetsUsecaseImp(Get.find()));
  }
}
