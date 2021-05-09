import 'package:go_social_test/domain/models/activity.dart';
import 'package:go_social_test/data/request/activity_request.dart';
import 'package:go_social_test/domain/repository/activity_repository.dart';
import 'package:mockito/mockito.dart';

class FakeActivityRepository implements ActivityRepository {
  @override
  Future<void> addNewActivity(ActivityRequest request) {
    // TODO: implement addNewActivity
    throw UnimplementedError();
  }

  @override
  Future<Activity> getActivityDetail(String id) {
    // TODO: implement getActivityDetail
    throw UnimplementedError();
  }

  @override
  Future<List<Activity>> getRecentActivities() {
    // TODO: implement getRecentActivities
    throw UnimplementedError();
  }
}

class MockActivityRepository extends Mock implements FakeActivityRepository {}

final ANY_GIVEN_ACTIVITY_REQUEST = ActivityRequest(
  'Test activity name',
  'Test activity description',
  [
    ANY_GIVEN_CATEGORY_NAME,
    ANY_GIVEN_CATEGORY_NAME,
  ],
  'Test activity location',
  'Test activity date',
);

const ANY_GIVEN_CATEGORY_NAME = 'Category name';

final ANY_GIVEN_ACTIVITY = ANY_GIVEN_ACTIVITY_REQUEST.toActivity(ANY_GIVEN_ID);
const ANY_GIVEN_ID = 'test id';
