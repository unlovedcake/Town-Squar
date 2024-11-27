import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:town_squar/app/helpers/asset_path.dart';
import 'package:town_squar/app/helpers/my_logger.dart';
import 'package:town_squar/app/helpers/responsive.dart';
import 'package:town_squar/app/modules/repositories/activities_repository.dart';
import 'package:town_squar/app/themes/app_colors.dart';
import 'package:town_squar/app/themes/app_theme.dart';

import '../controllers/activities_controller.dart';

part '../widgets/mobile_content_view_activities.dart';
part '../widgets/desktop_content_view_activities.dart';
part '../widgets/left_sidebar.dart';
part '../widgets/body_content.dart';
part '../widgets/right_sidebar.dart';

class ActivitiesView extends GetView<ActivitiesController> {
  const ActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Responsive.isMobile(context) || Responsive.isTablet(context)
              ? _MobileContentViewActivities()
              : _DesktopContentViewActivities()),
    );
  }
}
