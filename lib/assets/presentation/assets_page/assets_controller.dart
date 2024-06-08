import 'package:get/get.dart';

class AssetsController extends GetxController {
  // Loading status
  bool _isloading = false;
  bool get isLoading => _isloading;

  AssetsController() {
    _init();
  }

  void _init() async {
    _isloading = true;
    update();
  }
}
