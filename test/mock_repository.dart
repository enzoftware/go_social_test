import 'package:go_social_test/domain/models/activity.dart';
import 'package:go_social_test/data/request/activity_request.dart';
import 'package:go_social_test/domain/repository/activity_repository.dart';
import 'package:mockito/mockito.dart';

class FakeActivityRepository implements ActivityRepository {
  final activities;

  FakeActivityRepository({this.activities = const []});

  @override
  Future<void> addNewActivity(ActivityRequest request) async {
    activities.add(request.toActivity(ANY_GIVEN_ID));
  }

  @override
  Future<Activity> getActivityDetail(String id) async {
    return ANY_GIVEN_ACTIVITY;
  }

  @override
  Future<List<Activity>> getRecentActivities() async {
    return activities;
  }
}

class MockActivityRepository extends Mock implements FakeActivityRepository {}

final ANY_GIVEN_ACTIVITY_REQUEST = ActivityRequest(
  'Test activity name',
  'Test activity description',
  ANY_GIVEN_CATEGORIES,
  'Test activity location',
  'Test activity date',
);

const ANY_GIVEN_CATEGORY_NAME = 'Category name';

final ANY_GIVEN_ACTIVITY = ANY_GIVEN_ACTIVITY_REQUEST.toActivity(ANY_GIVEN_ID);
const ANY_GIVEN_ID = 'test id';
const ANY_GIVEN_NAME = 'test name';
const ANY_GIVEN_DESCRIPTION = 'test description';
const ANY_GIVEN_LOCATION = 'test location';
const ANY_GIVEN_DATE = 'test date';
const ANY_GIVEN_CATEGORIES = [ANY_GIVEN_CATEGORY_NAME, ANY_GIVEN_CATEGORY_NAME];
