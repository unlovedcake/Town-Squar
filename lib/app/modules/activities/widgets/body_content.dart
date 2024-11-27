part of '../views/activities_view.dart';

class BodyContent extends StatelessWidget {
  const BodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ActivitiesController(ActivitiesRepository()));

    bool isDesktop = MediaQuery.of(context).size.width >= 1024;

    return ListView(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          width: isDesktop ? 600 : double.infinity,
          child: Column(
            children: [
              _HeaderWidget(controller: controller),
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
              _ActivitiesListViewWidget(controller: controller)
            ],
          ),
        ),
      ],
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({
    super.key,
    required this.controller,
  });

  final ActivitiesController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                controller.formattedDate,
                style: controller.textTheme.bodyLarge?.copyWith(
                  fontSize: 12,
                  color: AppColors.neutral500,
                ),
              ),
              SizedBox(
                  height: controller.iconHeight,
                  child: SvgPicture.asset(
                    AssetPath.iconBell,
                  )),
            ],
          ),
          Text(
            "This week in Estepona",
            style: controller.textTheme.bodyLarge?.copyWith(
              fontSize: 20,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchWidget extends StatelessWidget {
  const _SearchWidget({
    super.key,
    required this.controller,
  });

  final ActivitiesController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
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
            child: TextField(
              decoration: InputDecoration(
                hintText: 'What do you feel like doing?',
                hintStyle: controller.textTheme.bodyLarge?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.neutral500,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
              height: controller.iconHeight,
              child: SvgPicture.asset(
                AssetPath.iconSearch,
              )),
        ],
      ),
    );
  }
}

class _ActivitiesListViewWidget extends StatelessWidget {
  const _ActivitiesListViewWidget({
    required this.controller,
  });

  final ActivitiesController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 18),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.yellow,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Today',
                      style: controller.textTheme.bodyLarge
                          ?.copyWith(fontSize: 16, color: AppColors.textPrimary, fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          text: '/${controller.today.toLowerCase()}',
                          style: controller.textTheme.bodyLarge?.copyWith(
                            fontSize: 16,
                            color: AppColors.neutral500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Obx(() => controller.status == ActivitiesStatus.loading
                  ? Center(child: CircularProgressIndicator())
                  : controller.status == ActivitiesStatus.empty
                      ? Center(
                          child: Column(
                          children: [
                            Image.asset(
                              AssetPath.iconEmpty,
                              width: 50,
                              height: 50,
                            ),
                            Text(
                              'No item found yet...',
                              style: controller.textTheme.bodyLarge
                                  ?.copyWith(fontSize: 18, color: AppColors.textPrimary, fontWeight: FontWeight.w500),
                            )
                          ],
                        ))
                      : controller.status == ActivitiesStatus.error
                          ? Center(
                              child: Column(
                              children: [
                                Image.asset(
                                  AssetPath.iconError,
                                  width: 50,
                                  height: 50,
                                ),
                                Text(
                                  'Something went wrong...',
                                  style: controller.textTheme.bodyLarge?.copyWith(
                                      fontSize: 18, color: AppColors.textPrimary, fontWeight: FontWeight.w500),
                                )
                              ],
                            ))
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.activities.length,
                              itemBuilder: (context, index) {
                                final activity = controller.activities[index];
                                return Stack(
                                  children: [
                                    Positioned(
                                      left: 6,
                                      top: 0,
                                      bottom: 0,
                                      child: DottedBorder(
                                        borderType: BorderType.Rect,
                                        dashPattern: [6, 8],
                                        color: AppColors.neutral500,
                                        strokeWidth: 2,
                                        customPath: (size) {
                                          // Only draw the left border
                                          return Path()
                                            ..moveTo(0, 0)
                                            ..lineTo(0, size.height);
                                        },
                                        child: SizedBox(
                                          width: 1,
                                          height: double.infinity,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                                      padding: const EdgeInsets.all(16.0),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
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
                                          // Text and buttons section
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${controller.displayFormatTime(activity.time.toString())} (${activity.duration} min)',
                                                  style: controller.textTheme.bodyLarge?.copyWith(
                                                      fontSize: 12,
                                                      color: AppColors.neutral500,
                                                      fontWeight: FontWeight.w500),
                                                ),
                                                const SizedBox(height: 4),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      activity.name,
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 22.0),
                                                      child: Text(
                                                        '${activity.price}€',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black87,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 4),
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      AssetPath.iconMapPin,
                                                    ),
                                                    Text(
                                                      activity.location,
                                                      style: controller.textTheme.bodyLarge?.copyWith(
                                                          fontSize: 12,
                                                          color: AppColors.neutral500,
                                                          fontWeight: FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 4),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 25,
                                                      child: ElevatedButton.icon(
                                                        onPressed: () {},
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor: AppColors.neutral200,
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(4),
                                                          ),
                                                        ),
                                                        icon: Icon(
                                                          Icons.person_2_outlined,
                                                          size: 20,
                                                          color: AppColors.neutral500,
                                                        ),
                                                        label: Text(
                                                          "${activity.availableSpots} spots left".tr,
                                                          style: controller.textTheme.bodyLarge?.copyWith(
                                                              fontSize: 10,
                                                              fontWeight: FontWeight.w500,
                                                              color: AppColors.textSecondary),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    SizedBox(
                                                      height: 25,
                                                      child: Row(
                                                        children: List.generate(
                                                          activity.size.length,
                                                          (index) => Container(
                                                            margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                                            padding: const EdgeInsets.symmetric(horizontal: 6.0),
                                                            decoration: BoxDecoration(
                                                              color: controller.colorBGSize(activity.size[index]),
                                                              borderRadius: BorderRadius.circular(4.0),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                activity.size[index],
                                                                style: TextStyle(
                                                                  color: controller.colorTextSize(activity.size[index]),
                                                                  fontSize: 10.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    SizedBox(
                                                      height: 35,
                                                      child: Obx(() => ElevatedButton(
                                                            onPressed: activity.availableSpots == 0 ||
                                                                    activity.joinedList.contains('userid123')
                                                                ? null
                                                                : () {
                                                                    controller.activeButtonJoinIndex.value = index;
                                                                    controller.saveJoin(activity);
                                                                  },
                                                            style: ElevatedButton.styleFrom(
                                                              disabledBackgroundColor: AppColors.neutral500,
                                                              backgroundColor: AppColors.textPrimary,
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(4),
                                                              ),
                                                            ),
                                                            child: controller.activeButtonJoinIndex.value == index &&
                                                                    controller.statusJoin == ActivitiesJoinStatus.saving
                                                                ? SizedBox(
                                                                    height: 20,
                                                                    width: 20,
                                                                    child: CircularProgressIndicator(
                                                                      strokeWidth: 1,
                                                                      color: AppColors.lightIntensity,
                                                                    ))
                                                                : Text(
                                                                    activity.joinedList.contains('userid123')
                                                                        ? 'Joined'
                                                                        : activity.availableSpots != 0
                                                                            ? 'join'.tr
                                                                            : 'Sold Out'.tr,
                                                                    style: controller.textTheme.bodyLarge?.copyWith(
                                                                        fontSize: 12,
                                                                        fontWeight: FontWeight.w400,
                                                                        color: AppColors.background),
                                                                  ),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              })),
            ],
          ),
        ],
      ),
    );
  }
}

class _CategoriesWidget extends StatelessWidget {
  const _CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ActivitiesController(ActivitiesRepository()));
    return Container(
      margin: EdgeInsets.only(left: 18, bottom: 6),
      width: double.infinity,
      height: 27,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            final category = controller.categories[index];
            return Obx(() => AnimatedContainer(
                  margin: EdgeInsets.only(right: 8),
                  duration: Duration(milliseconds: 500),
                  child: ElevatedButton(
                      onPressed: () {
                        MyLogger.printMessage('Selected Category: ${category['text'].toString()}');

                        controller.activeButtonCategoryIndex.value = index;

                        controller.selectCategory(category['text'].toString());
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                        backgroundColor: index == controller.activeButtonCategoryIndex.value
                            ? AppColors.secondary400
                            : AppColors.secondary200,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: index != controller.activeButtonCategoryIndex.value
                                  ? Colors.transparent
                                  : AppColors.lightIntensity),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: index == 0
                          ? SvgPicture.asset(
                              height: 20,
                              category['icon'].toString(),
                            )
                          : Text(
                              textAlign: TextAlign.center,
                              category['text'].toString(),
                              style: controller.textTheme.bodyLarge?.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textPrimary,
                              ),
                            )),
                ));
          }),
    );
  }
}
