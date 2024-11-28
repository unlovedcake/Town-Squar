import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/services_controller.dart';

class ServicesView extends GetView<ServicesController> {
  const ServicesView({super.key});
  @override
  Widget build(BuildContext context) {
    //final controller = Get.find<ServicesController>();
    return const Center(
      child: Text(
        'ServicesView is working',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }
}
