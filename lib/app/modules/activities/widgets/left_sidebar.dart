part of '../views/activities_view.dart';

class LeftSideBar extends StatelessWidget {
  const LeftSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ActivitiesController(ActivitiesRepository()));

    return Container(
      height: double.infinity,
      color: Colors.black,
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          SizedBox(
              height: 43,
              width: 156,
              child: SvgPicture.asset(
                AssetPath.appLogo,
              )),
          SizedBox(
            height: 30,
          ),

          // _buttonLeftSideBar(controller, AssetPath.iconActivities, 'Activities'),
          // _buttonLeftSideBar(controller, AssetPath.iconLocation, 'Locations'),
          // _buttonLeftSideBar(controller, AssetPath.iconServices, 'Services'),
          // _buttonLeftSideBar(controller, AssetPath.iconCommunity, 'Communities'),
          // _buttonLeftSideBar(controller, AssetPath.iconBell, 'Notifications'),
          // _buttonLeftSideBar(controller, AssetPath.iconPlus, 'Create'),
          // _buttonLeftSideBar(controller, AssetPath.iconPlus, 'Profile'),
          Column(
              children: List.generate(
            controller.sideBarTitle.length,
            (index) => InkWell(
              onHover: (isHovering) {
                final label = controller.sideBarTitle[index]['text'].toString();
                if (isHovering) {
                  controller.hoveredItem.value = label;
                } else {
                  controller.hoveredItem.value = '';
                }
              },
              onTap: () {
                controller.activeButtonSideBar.value = index;

                controller.gotoPage(controller.sideBarTitle[index]['text'].toString());
              },
              child: Obx(() {
                final isHovered = controller.hoveredItem.value == controller.sideBarTitle[index]['text'].toString();
                return AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  padding: EdgeInsets.all(8.0),
                  width: 200,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: controller.activeButtonSideBar.value == index
                        ? AppColors.primary600
                        : isHovered
                            ? AppColors.neutral500
                            : AppColors.textPrimary,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Wrap(
                    spacing: 20,
                    children: [
                      SvgPicture.asset(
                        color: Colors.white,
                        controller.sideBarTitle[index]['icon'].toString(),
                      ),
                      Text(
                        controller.sideBarTitle[index]['text'].toString(),
                        style: controller.textTheme.bodyLarge?.copyWith(
                          fontSize: 20,
                          color: AppColors.background,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      if (index == 6)
                        SvgPicture.asset(
                          AssetPath.iconMoreVertical,
                          color: AppColors.background,
                        ),
                    ],
                  ),
                );
              }),
            ),
          )),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Obx _buttonLeftSideBar(ActivitiesController controller, String assetPath, String label) {
    return Obx(() => InkWell(
        onHover: (isHovering) {
          if (isHovering) {
            controller.hoveredItem.value = label;
          } else {
            controller.hoveredItem.value = '';
          }
        },
        onTap: () {
          controller.activeButtonLeftSidebarIndex.value = label;
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          padding: EdgeInsets.all(8.0),
          width: 200,
          margin: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: controller.activeButtonLeftSidebarIndex.value == label
                ? AppColors.primary600
                : controller.hoveredItem.value == label
                    ? AppColors.neutral500
                    : AppColors.textPrimary,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Wrap(
            spacing: 20,
            children: [
              label != 'Profile'
                  ? SvgPicture.asset(color: Colors.white, assetPath)
                  : CircleAvatar(
                      radius: 12,
                    ),
              Text(
                label,
                style: controller.textTheme.bodyLarge?.copyWith(
                  fontSize: 20,
                  color: AppColors.background,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              if (label == 'Profile') SvgPicture.asset(color: Colors.white, AssetPath.iconMoreVertical),
            ],
          ),
        )));
  }
}
