import 'package:get/get.dart';
import 'package:tr_treeview/assets/presentation/home_page/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
