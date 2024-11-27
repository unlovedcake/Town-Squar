import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:town_squar/app/helpers/responsive.dart';
import 'package:town_squar/app/themes/app_colors.dart';
import 'package:town_squar/app/helpers/asset_path.dart';
import 'package:town_squar/app/modules/activities/views/activities_view.dart';
import 'package:town_squar/app/modules/community/views/community_view.dart';
import 'package:town_squar/app/modules/services/views/services_view.dart';
import '../controllers/dashboard_controller.dart';
part '../widgets/index_stack_with_fade_animation.dart';

class DashboardView extends GetView<DashboardController> {
  DashboardView({super.key});

  final controller = Get.put(DashboardController());

  List<Widget> _buildScreens() {
    return [
      ActivitiesView(),
      CommunityView(),
      ServicesView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: Responsive.isDesktop(context) ? null : _buildBottomNavigationBar(context),
    );
  }

  Obx _buildBody() {
    return Obx(
      () => _IndexStackWithFadeAnimation(
        index: controller.currentIndex,
        children: _buildScreens(),
      ),
    );
  }

  Obx _buildBottomNavigationBar(BuildContext context) {
    final iconHeight = 24.0;
    return Obx(
      () => BottomNavigationBar(
        selectedItemColor: AppColors.lightIntensity,
        unselectedItemColor: const Color(0xFF686777),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 12,
              height: 1.8,
              fontWeight: FontWeight.w600,
            ),
        unselectedLabelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 12,
              height: 1.8,
              color: const Color(0xFF686777),
              fontWeight: FontWeight.w500,
            ),
        elevation: 3,
        backgroundColor: Colors.white,
        currentIndex: controller.currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => controller.setCurrentIndexValue(index),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              height: iconHeight,
              AssetPath.iconBell,
            ),

            // Image.asset(
            //   AssetPath.iconActivities,
            //   height: iconHeight,
            // ),
            activeIcon: SvgPicture.asset(
              AssetPath.iconActivities,
              height: iconHeight,
              color: AppColors.lightIntensity,
            ),
            label: 'activities'.tr,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetPath.iconCommunity,
              height: iconHeight,
            ),
            activeIcon: SvgPicture.asset(
              AssetPath.iconCommunity,
              height: iconHeight,
              color: const Color.fromARGB(255, 24, 103, 139),
            ),
            label: 'community'.tr,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetPath.iconServices,
              height: iconHeight,
            ),
            activeIcon: SvgPicture.asset(
              AssetPath.iconServices,
              height: iconHeight,
              color: AppColors.lightIntensity,
            ),
            label: 'services'.tr,
          ),
        ],
      ),
    );
  }
}
