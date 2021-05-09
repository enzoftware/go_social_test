import 'package:flutter_test/flutter_test.dart';
import 'package:go_social_test/features/activity_provider.dart';

import 'mock_repository.dart';

void main() {
  group('ActivityProviderTest', () {
    ActivityProvider activityProvider;
    setUp(() {
      activityProvider = ActivityProvider(FakeActivityRepository());
    });
    test('Should check if initially is not loading and has no activities', () {
      expect(activityProvider.isLoading, false);
      expect(activityProvider.activities, null);
    });

    test('Should check if load activities success', () async {
      expect(activityProvider.isLoading, false);
      final result = activityProvider.loadActivities();
      expect(activityProvider.isLoading, isTrue);
      await result;
      expect(activityProvider.isLoading, isFalse);
    });

    test('Should check if add activity success', () async {
      expect(activityProvider.isLoading, false);
      final result = activityProvider.addNewActivity(
        ANY_GIVEN_NAME,
        ANY_GIVEN_DESCRIPTION,
        ANY_GIVEN_LOCATION,
        ANY_GIVEN_DATE,
        ANY_GIVEN_CATEGORIES,
      );
      expect(activityProvider.isLoading, isTrue);
      await result;
      await activityProvider.loadActivities();
      expect(activityProvider.isLoading, isFalse);
    });
  });
}
