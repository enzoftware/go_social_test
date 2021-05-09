import 'package:go_social_test/data/repository/fake_data.dart';
import 'package:go_social_test/data/request/activity_request.dart';
import 'package:go_social_test/domain/models/activity.dart';
import 'package:go_social_test/domain/repository/activity_repository.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  @override
  Future<void> addNewActivity(ActivityRequest request) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final id = DateTime.now().millisecondsSinceEpoch.toString();
      final activity = request.toActivity(id);
      mockActivities.insert(0, activity);
    } catch (e) {
      throw Exception('Error adding a new activity');
    }
  }

  @override
  Future<Activity> getActivityDetail(String id) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return mockActivities.firstWhere((item) => item.id == id);
    } catch (e) {
      throw Exception('Error getting detailed info of the event');
    }
  }

  @override
  Future<List<Activity>> getRecentActivities() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return mockActivities;
    } catch (e) {
      throw Exception('Error fetching activities');
    }
  }

  @override
  Future<void> updateActivity(Activity activity) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final index = mockActivities.indexWhere((item) => item.id == activity.id);
      mockActivities[index] = activity;
    } catch (e) {
      throw Exception('Activity not found');
    }
  }
}
