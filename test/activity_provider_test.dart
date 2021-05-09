import 'dart:ffi';

import 'package:flutter_test/flutter_test.dart';
import 'package:go_social_test/domain/models/activity.dart';
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
      when(activityProvider.repository.getRecentActivities())
          .thenAnswer((_) async => <Activity>[ANY_GIVEN_ACTIVITY]);
      final result = activityProvider.loadActivities();
      expect(activityProvider.isLoading, isTrue);
      await result;
      expect(activityProvider.isLoading, isFalse);
      expect(activityProvider.activities, isNotNull);
      expect(activityProvider.activities.length, 1);
    });

    test('Should check if load activities fails', () async {
      expect(activityProvider.isLoading, false);
      when(activityProvider.repository.getRecentActivities())
          .thenAnswer((_) async => throw Exception());
      final result = activityProvider.loadActivities();
      expect(activityProvider.isLoading, isTrue);
      await result;
      expect(activityProvider.isLoading, isFalse);
      expect(activityProvider.activities, isNull);
    });

    test('Should check if add activity success', () async {
      expect(activityProvider.isLoading, false);
      when(activityProvider.repository
              .addNewActivity(ANY_GIVEN_ACTIVITY_REQUEST))
          .thenAnswer((_) async => Void);
      final result = activityProvider.addNewActivity(
        ANY_GIVEN_NAME,
        ANY_GIVEN_DESCRIPTION,
        ANY_GIVEN_LOCATION,
        ANY_GIVEN_DATE,
        ANY_GIVEN_CATEGORIES,
      );
      expect(activityProvider.isLoading, isTrue);
      await result;
      expect(activityProvider.isLoading, isFalse);
    });

    test('Should check if add activity fails', () async {
      expect(activityProvider.isLoading, false);
      when(activityProvider.repository
              .addNewActivity(ANY_GIVEN_ACTIVITY_REQUEST))
          .thenAnswer((_) async => throw Exception());
      final result = activityProvider.addNewActivity(
        ANY_GIVEN_NAME,
        ANY_GIVEN_DESCRIPTION,
        ANY_GIVEN_LOCATION,
        ANY_GIVEN_DATE,
        ANY_GIVEN_CATEGORIES,
      );
      expect(activityProvider.isLoading, isTrue);
      await result;
      expect(activityProvider.isLoading, isFalse);
    });

    test('Should check if detail activity success', () async {
      expect(activityProvider.isLoading, false);
      when(activityProvider.repository.getActivityDetail(ANY_GIVEN_ID))
          .thenAnswer((_) async => ANY_GIVEN_ACTIVITY);
      final result = activityProvider.getDetailActivity(ANY_GIVEN_ID);
      expect(activityProvider.isLoading, isTrue);
      await result;
      expect(activityProvider.isLoading, isFalse);
      expect(activityProvider.activityDetail, isNotNull);
    });

    test('Should check if detail activity fails', () async {
      expect(activityProvider.isLoading, false);
      when(activityProvider.repository.getActivityDetail(ANY_GIVEN_ID))
          .thenAnswer((_) async => throw Exception());
      final result = activityProvider.getDetailActivity(ANY_GIVEN_ID);
      expect(activityProvider.isLoading, isTrue);
      await result;
      expect(activityProvider.isLoading, isFalse);
      expect(activityProvider.activityDetail, isNull);
    });

    test('Should check if update activity success', () async {
      expect(activityProvider.isLoading, false);
      when(activityProvider.repository.updateActivity(ANY_GIVEN_ACTIVITY))
          .thenAnswer((_) async => Void);
      final result = activityProvider.updateActivity(ANY_GIVEN_ACTIVITY);
      expect(activityProvider.isLoading, isTrue);
      await result;
      expect(activityProvider.isLoading, isFalse);
    });

    test('Should check if update activity fails', () async {
      expect(activityProvider.isLoading, false);
      when(activityProvider.repository.updateActivity(ANY_GIVEN_ACTIVITY))
          .thenAnswer((_) async => throw Exception());
      final result = activityProvider.updateActivity(ANY_GIVEN_ACTIVITY);
      expect(activityProvider.isLoading, isTrue);
      await result;
      expect(activityProvider.isLoading, isFalse);
    });
  });
}
