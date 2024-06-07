import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:tr_treeview/assets/core/routes.dart';

import 'package:tr_treeview/assets/domain/usecases/get_companies_usecase.dart';
import 'package:tr_treeview/assets/presentation/shared_widgets/home_main_button.dart';

class HomeController extends GetxController {
  // Loading
  bool _isloading = false;
  bool get isLoading => _isloading;

  List<Widget> companiesButtonsList = [];

  HomeController() {
    _init();
  }

  final getCompaniesList = Get.find<GetCompaniesUsecase>();

  void _init() async {
    _isloading = true;
    update();

    final companiesList = await getCompaniesList();

    if (companiesList.isNotEmpty) {
      companiesButtonsList = companiesList
          .map(
            (hmb) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: HomeMainButton(
                title: "${hmb.name} Unit",
                id: hmb.id,
                onPressed: () {
                  Get.toNamed(
                    Routes.assets,
                    arguments: hmb.id,
                    preventDuplicates: true,
                  );
                },
              ),
            ),
          )
          .toList();
    }

    _isloading = false;
    update();
  }
}
