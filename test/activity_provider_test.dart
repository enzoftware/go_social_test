import 'package:flutter_test/flutter_test.dart';
import 'package:go_social_test/features/activity_provider.dart';
import 'package:mockito/mockito.dart';

import 'mock_repository.dart';

void main() {
  group('ActivityProviderTest', () {
    ActivityProvider activityProvider;
    setUp(() {
      activityProvider = ActivityProvider(MockActivityRepository());
    });
    test('Should check if initially is not loading and has no activities', () {
      expect(activityProvider.isLoading, false);
      expect(activityProvider.activities, null);
    });

    test('Should check if load activities success', () async {
      expect(activityProvider.isLoading, false);
      final result = activityProvider.loadActivities();
      verify(activityProvider.repository.getRecentActivities());
      expect(activityProvider.isLoading, isTrue);
      await result;
      expect(activityProvider.isLoading, isFalse);
    });
  });
}
