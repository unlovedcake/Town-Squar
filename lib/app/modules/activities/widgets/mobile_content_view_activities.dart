part of '../views/activities_view.dart';

class _MobileContentViewActivities extends StatelessWidget {
  const _MobileContentViewActivities({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ActivitiesController(ActivitiesRepository()));

    bool isDesktop = MediaQuery.of(context).size.width >= 1024;
    return ListView(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            width: isDesktop ? 600 : double.infinity,
            child: Column(
              children: [
                _HeaderWidget(controller: controller),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "You're close to your goal!",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Join more sport activities to collect more points",
                              style: controller.textTheme.bodyLarge
                                  ?.copyWith(fontSize: 12, color: AppColors.textPrimary, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(80, 22),
                                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  child: Text(
                                    "join now".tr,
                                    style: controller.textTheme.bodyLarge?.copyWith(
                                        fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.background),
                                  ),
                                ),
                                const SizedBox(width: 11),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(80, 22),
                                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  child: Text(
                                    "my points".tr,
                                    style: controller.textTheme.bodyLarge?.copyWith(
                                        fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.background),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Circular progress indicator
                      SizedBox(
                        width: 73,
                        height: 75,
                        child: Obx(() => Stack(
                              fit: StackFit.expand,
                              children: [
                                CircularProgressIndicator(
                                  value: controller.progress.value,
                                  strokeWidth: 6,
                                  backgroundColor: AppColors.background,
                                  valueColor: const AlwaysStoppedAnimation<Color>(
                                    AppColors.primary600,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '${controller.displayPercentage.value}',
                                    style: controller.textTheme.bodyLarge?.copyWith(
                                      fontSize: 25,
                                      color: AppColors.textPrimary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _SearchWidget(controller: controller),
                SizedBox(
                  height: 20,
                ),
                _CategoriesWidget(),
                SizedBox(
                  height: 20,
                ),
                _ActivitiesListViewWidget(controller: controller),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
