import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:tr_treeview/assets/presentation/assets/assets_page.dart';
import 'package:tr_treeview/assets/presentation/home/home_page.dart';

abstract class Routes {
  static const home = "/home";
  static const assets = "/assets";
}

final routes = [
  GetPage(
    name: Routes.home,
    page: () => const HomePage(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 1240),
  ),
  GetPage(
    name: Routes.assets,
    page: () => const AssetsPage(),
    transition: Transition.fadeIn,
    preventDuplicates: true,
  ),
];
