import 'package:get/get.dart';
import 'package:town_squar/app/modules/repositories/activities_repository.dart';

import '../controllers/activities_controller.dart';

class ActivitiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivitiesController>(
      () => ActivitiesController(ActivitiesRepository()),
    );
  }
}
