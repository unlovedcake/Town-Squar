import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:town_squar/app/helpers/firebase_instance.dart';
import 'package:town_squar/app/helpers/my_logger.dart';
import 'package:town_squar/app/models/activities_model.dart';

class ActivitiesRepository {
  static DateTime today = DateTime.now();

  static DateTime startOfToday = DateTime(today.year, today.month, today.day);
  static DateTime endOfToday = startOfToday.add(Duration(days: 1));

  ActivitiesRepository({firestore});

  Stream<List<ActivitiesModel>> fetchActivities() {
    try {
      return firestore
          .collection('activities')
          .where('time', isGreaterThanOrEqualTo: startOfToday)
          .where('time', isLessThan: endOfToday)
          .orderBy('time', descending: false)
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) {
                return ActivitiesModel.fromJson(
                    doc.data() as Map<String, dynamic>);
              }).toList());
    } catch (e) {
      MyLogger.printError('Error Fetch Activities ===> $e');

      rethrow;
    }
  }

  Future<List<ActivitiesModel>> filterByCategory(String category) async {
    try {
      final snapshot = await firestore
          .collection('activities')
          .where('category', isEqualTo: category)
          .where('time', isGreaterThanOrEqualTo: startOfToday)
          .where('time', isLessThan: endOfToday)
          .orderBy('time', descending: false)
          .get();

      return snapshot.docs.map((doc) {
        return ActivitiesModel.fromJson(doc.data());
      }).toList();
    } catch (e) {
      MyLogger.printError('Error Fetch Categories ===> $e');

      rethrow;
    }
  }
}
