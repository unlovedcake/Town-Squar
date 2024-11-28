part of '../views/activities_view.dart';

class _DesktopContentViewActivities extends StatelessWidget {
  _DesktopContentViewActivities({super.key});

  final controller = Get.put(ActivitiesController(ActivitiesRepository()));

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: LeftSideBar()),
        Expanded(
          flex: 6,
          child: Obx(
            () => AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: controller.activeButtonSideBar.value == 0
                  ? BodyContent()
                  : controller.activeButtonSideBar.value == 1
                      ? LocationsView()
                      : controller.activeButtonSideBar.value == 2
                          ? ServicesView()
                          : CommunityView(),
            ),
          ),
        ),
        Expanded(flex: 2, child: RightSidebar()),
      ],
    );
  }
}
