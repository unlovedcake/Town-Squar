import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/locations_controller.dart';

class LocationsView extends GetView<LocationsController> {
  const LocationsView({super.key});
  @override
  Widget build(BuildContext context) {
    //final controller = Get.find<LocationsController>();
    return const Center(
      child: Text(
        'LocationsView is working',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }
}
