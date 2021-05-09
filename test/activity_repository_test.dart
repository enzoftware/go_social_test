import 'dart:ffi';

import 'package:flutter_test/flutter_test.dart';
import 'package:go_social_test/domain/models/activity.dart';
import 'package:go_social_test/domain/repository/activity_repository.dart';
import 'package:mockito/mockito.dart';

import 'mock_repository.dart';

void main() {
  group('ActivityProviderTest', () {
    ActivityRepository repository;
    setUp(() {
      repository = MockActivityRepository();
    });
    test('Should check load activities', () async {
      when(repository.getRecentActivities())
          .thenAnswer((_) async => <Activity>[ANY_GIVEN_ACTIVITY]);
      final result = await repository.getRecentActivities();
      verify(repository.getRecentActivities());
      expect(result.length, 1);
    });

    test('Should check getting activity detail', () async {
      when(repository.getActivityDetail(ANY_GIVEN_ID))
          .thenAnswer((_) async => ANY_GIVEN_ACTIVITY);
      final result = await repository.getActivityDetail(ANY_GIVEN_ID);
      verify(repository.getActivityDetail(ANY_GIVEN_ID));
      expect(result.id, ANY_GIVEN_ID);
      expect(result.name, ANY_GIVEN_ACTIVITY.name);
    });

    test('Should check add new activity', () async {
      when(repository.addNewActivity(ANY_GIVEN_ACTIVITY_REQUEST))
          .thenAnswer((_) async => Void);
      await repository.addNewActivity(ANY_GIVEN_ACTIVITY_REQUEST);
      verify(repository.addNewActivity(ANY_GIVEN_ACTIVITY_REQUEST));
    });

    test('Should check update activity', () async {
      when(repository.updateActivity(ANY_GIVEN_ACTIVITY))
          .thenAnswer((_) async => Void);
      await repository.updateActivity(ANY_GIVEN_ACTIVITY);
      verify(repository.updateActivity(ANY_GIVEN_ACTIVITY));
    });
  });
}
