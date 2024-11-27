part of '../views/activities_view.dart';

class RightSidebar extends StatelessWidget {
  const RightSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ActivitiesController(ActivitiesRepository()));

    return Container(
      margin: EdgeInsets.only(right: 12, top: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _CloseToGoalWidget(controller: controller),
          SizedBox(
            height: 20,
          ),
          _WeeklyWorkShopWidget(controller: controller),
          SizedBox(
            height: 20,
          ),
          _PopularEventsWidget(controller: controller),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class _PopularEventsWidget extends StatelessWidget {
  const _PopularEventsWidget({
    super.key,
    required this.controller,
  });

  final ActivitiesController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(
                    AssetPath.bgSeeMore,
                  ), // Replace with your image asset path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 12,
              top: 20,
              right: 0,
              child: Text(
                'Popular event near you!',
                style: controller.textTheme.bodyLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Positioned(
              left: 12,
              bottom: 80,
              right: 0,
              child: Text(
                'Unleash the fun! Explore the world of exciting events happening near you.',
                style: controller.textTheme.bodyLarge?.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            Positioned(
              left: 50,
              bottom: 20,
              right: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Add your onPressed logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Background color
                  foregroundColor: Colors.black, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Border radius
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  elevation: 2, // Optional elevation
                ),
                child: Text(
                  'See more',
                  style: controller.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500, color: AppColors.textPrimary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeeklyWorkShopWidget extends StatelessWidget {
  const _WeeklyWorkShopWidget({
    super.key,
    required this.controller,
  });

  final ActivitiesController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.yellow100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Weekly workshops for kids!",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Signup for early access to weekly activities for your kids full of learning and fun.",
            style: controller.textTheme.bodyLarge
                ?.copyWith(fontSize: 12, color: AppColors.textPrimary, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(8),
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Learn more',
                  style: controller.textTheme.bodyLarge
                      ?.copyWith(fontSize: 14, color: AppColors.textPrimary, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                    height: controller.iconHeight,
                    child: SvgPicture.asset(
                      AssetPath.iconArrowForward,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CloseToGoalWidget extends StatelessWidget {
  const _CloseToGoalWidget({
    super.key,
    required this.controller,
  });

  final ActivitiesController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            children: [
              Expanded(
                child: Text(
                  "Join more sport activities to collect more points",
                  style: controller.textTheme.bodyLarge
                      ?.copyWith(fontSize: 12, color: AppColors.textPrimary, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 33,
                height: 35,
                child: Obx(() => Stack(
                      fit: StackFit.expand,
                      children: [
                        CircularProgressIndicator(
                          value: controller.progress.value,
                          strokeWidth: 4,
                          backgroundColor: AppColors.background,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.primary600,
                          ),
                        ),
                        Center(
                          child: Text(
                            '${controller.displayPercentage.value}',
                            style: controller.textTheme.bodyLarge?.copyWith(
                              fontSize: 14,
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
          const SizedBox(height: 16),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text(
                  "join now".tr,
                  style: controller.textTheme.bodyLarge
                      ?.copyWith(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.background),
                ),
              ),
              const SizedBox(width: 11),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text(
                  "my points".tr,
                  style: controller.textTheme.bodyLarge
                      ?.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.background),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
