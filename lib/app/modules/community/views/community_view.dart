import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/community_controller.dart';

class CommunityView extends GetView<CommunityController> {
  const CommunityView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'CommunityView is working',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }
}
