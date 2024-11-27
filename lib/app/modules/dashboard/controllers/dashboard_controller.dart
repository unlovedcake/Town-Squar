import 'package:get/get.dart';

class DashboardController extends GetxController {
  final _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setCurrentIndexValue(int index) {
    if (index == _currentIndex.value) {
      return;
    }
    _currentIndex.value = index;
  }
}
