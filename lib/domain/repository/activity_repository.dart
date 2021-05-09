import 'package:go_social_test/data/request/activity_request.dart';
import 'package:go_social_test/domain/models/activity.dart';

abstract class ActivityRepository {
  /// This method will retrieve a [List<Activity>] for a User
  Future<List<Activity>> getRecentActivities();

  /// This method will get detail information from an activity by the [id]
  Future<Activity> getActivityDetail(String id);

  /// This method will add a new activity for a user
  /// This will use a [ActivityRequest] to transform to an [Activity]
  Future<void> addNewActivity(ActivityRequest request);

  /// This method will update the [Activity] created by a user
  /// [activity] is the new activity that replace the old
  Future<void> updateActivity(Activity activity);
}
