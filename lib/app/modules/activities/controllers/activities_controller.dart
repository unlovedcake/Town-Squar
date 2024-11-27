import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:town_squar/app/helpers/asset_path.dart';
import 'package:town_squar/app/helpers/custom_snackbar.dart';
import 'package:town_squar/app/helpers/firebase_instance.dart';
import 'package:town_squar/app/helpers/my_logger.dart';
import 'package:town_squar/app/models/activities_model.dart';
import 'package:town_squar/app/modules/repositories/activities_repository.dart';
import 'package:town_squar/app/routes/app_pages.dart';
import 'package:town_squar/app/themes/app_colors.dart';

enum ActivitiesStatus { initial, loading, loaded, empty, error }

enum ActivitiesJoinStatus { initial, saving, success, error }

class ActivitiesController extends GetxController {
  ActivitiesController(this.repository);

  final ActivitiesRepository repository;

  final formattedDate = DateFormat('EEE, MMM d').format(DateTime.now());

  final today = DateFormat('EEEE').format(DateTime.now());

  final activities = <ActivitiesModel>[].obs;

  final ctx = Get.context;

  var textTheme = TextTheme();

  final activeButtonCategoryIndex = 1.obs;
  final activeButtonJoinIndex = 0.obs;

  final activeButtonLeftSidebarIndex = 'Activities'.obs;

  final activeButtonSideBar = 0.obs;
  final iconHeight = 24.0;

  final Rx<ActivitiesStatus> _status = ActivitiesStatus.initial.obs;
  ActivitiesStatus get status => _status.value;

  final Rx<ActivitiesJoinStatus> _statusJoin = ActivitiesJoinStatus.initial.obs;
  ActivitiesJoinStatus get statusJoin => _statusJoin.value;

  var progress = 0.0.obs;
  var displayPercentage = 0.obs;
  final int givenValue = 30;
  final int maxValue = 100;

  final hoveredItem = ''.obs;

  final List<Map<String, dynamic>> categories = [
    {
      'text': '',
      'icon': AssetPath.iconSliders,
    },
    {
      'text': 'All',
      'icon': '',
    },
    {
      'text': 'Sports',
      'icon': '',
    },
    {
      'text': 'Food',
      'icon': '',
    },
    {
      'text': 'Kids',
      'icon': '',
    },
    {
      'text': 'Creative',
      'icon': '',
    },
  ];

  final List<Map<String, String>> sideBarTitle = [
    {
      'text': 'Activities',
      'icon': AssetPath.iconActivities,
    },
    {
      'text': 'Locations',
      'icon': AssetPath.iconLocation,
    },
    {
      'text': 'Services',
      'icon': AssetPath.iconServices,
    },
    {
      'text': 'Communities',
      'icon': AssetPath.iconCommunity,
    },
    {
      'text': 'Notifications',
      'icon': AssetPath.iconBell,
    },
    {
      'text': 'Create',
      'icon': AssetPath.iconPlus,
    },
    {
      'text': 'Profile',
      'icon': AssetPath.iconCommunity,
    },
  ];

  void _startAnimation() async {
    int currentValue = 0;
    const duration = Duration(milliseconds: 30);

    while (currentValue <= givenValue) {
      await Future.delayed(duration, () {
        progress.value = currentValue / maxValue;
        displayPercentage.value = currentValue;
        currentValue++;
      });
    }
  }

  String displayFormatTime(String time) {
    DateTime dateTime = DateTime.parse(time);

    // Format the time to 12-hour format with minutes and AM/PM
    final formattedTime = DateFormat('h:mm a').format(dateTime);

    return formattedTime;
  }

  Color colorBGSize(String text) {
    Color? color;
    switch (text) {
      case 'childcare':
        color = AppColors.childCare100;
        break;
      case 'light':
        color = AppColors.primary;
      case 'high':
        color = AppColors.highIntensity;
      default:
        color = AppColors.secondary200;
    }

    return color;
  }

  Color colorTextSize(String text) {
    Color? color;
    switch (text) {
      case 'childcare':
        color = AppColors.childCare;
        break;
      case 'light':
        color = AppColors.primary600;
      case 'high':
        color = AppColors.highIntensity100;
      default:
        color = AppColors.secondary400;
    }

    return color;
  }

  @override
  void onInit() {
    super.onInit();
    textTheme = Theme.of(ctx!).textTheme;
    fetchActivities();
    _startAnimation();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void gotoPage(String page) {
    switch (page) {
      case 'Activities':
        Get.toNamed(AppPages.DASHBOARD);
        break;
      case 'Locations':
        Get.toNamed(AppPages.LOCATIONS);
        break;

      case 'Services':
        Get.toNamed(AppPages.SERVICES);
        break;

      case 'Communities':
        Get.toNamed(AppPages.COMMUNITY);
        break;

      case 'Notifications':
        break;

      case 'Create':
        break;

      default:
    }
  }

  void fetchActivities() {
    _status.value = ActivitiesStatus.loading;
    try {
      repository.fetchActivities().listen((data) {
        activities.value = data;

        if (activities.isEmpty) {
          MyLogger.printSuccess('Empty Activities ===>  $activities');

          _status.value = ActivitiesStatus.empty;
        } else {
          _status.value = ActivitiesStatus.loaded;
          MyLogger.printSuccess('Fetched Activities ===>  $activities');
        }
      });
    } catch (e) {
      MyLogger.printError('Error: $e');
      _status.value = ActivitiesStatus.error;
    }
  }

  void selectCategory(String category) {
    if (category == 'All') {
      fetchActivities();
    } else {
      fetchFilterByCategory(category);
    }
  }

  Future<void> fetchFilterByCategory(String category) async {
    _status.value = ActivitiesStatus.loading;
    try {
      final filterCategory = await repository.filterByCategory(category);
      if (filterCategory.isEmpty) {
        MyLogger.printSuccess('Empty Filter Category ===>  $filterCategory');

        _status.value = ActivitiesStatus.empty;
      } else {
        activities.value.clear();
        activities.value = filterCategory;
        _status.value = ActivitiesStatus.loaded;
        MyLogger.printSuccess('Fetched Filter Categories ===>  $activities');
      }
    } catch (e) {
      MyLogger.printError('Error: $e');
      _status.value = ActivitiesStatus.error;
    }
  }

  Future<void> saveJoin(ActivitiesModel activity) async {
    _statusJoin.value = ActivitiesJoinStatus.saving;
    WriteBatch batch = firestore.batch();

    final Map<String, dynamic> joinedData = {
      'user_id': 'userid123',
      'user_name': 'Sample User',
      'user_email': 'sample@gmail.com',
      'created_at': DateTime.now(),
      'activities': activity.toJson(),
    };

    final joinedDocRef = firestore.collection('activities_joined').doc();

    batch.set(joinedDocRef, joinedData);

    final activityDocRef = firestore.collection('activities').doc(activity.id);

    batch.update(activityDocRef, {
      'available_spots': FieldValue.increment(-1),
      'joined_list': FieldValue.arrayUnion(['userid123']),
    });

    try {
      await batch.commit();
      _statusJoin.value = ActivitiesJoinStatus.success;
      CustomSnackBar.showCustomSuccessSnackBar(
          icon: Icon(Icons.check), title: 'Success', message: 'Successfully joined ${activity.name}');
    } catch (e) {
      _statusJoin.value = ActivitiesJoinStatus.error;
      CustomSnackBar.showCustomErrorToast(icon: Icon(Icons.error), title: 'Error', message: e.toString());
    } finally {
      _statusJoin.value = ActivitiesJoinStatus.initial;
    }
  }
}
