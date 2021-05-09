import 'package:flutter/material.dart';
import 'package:go_social_test/data/request/activity_request.dart';
import 'package:go_social_test/domain/models/activity.dart';
import 'package:go_social_test/domain/repository/activity_repository.dart';

class ActivityProvider extends ChangeNotifier {
  final ActivityRepository repository;

  ActivityProvider(this.repository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Activity> _activities;
  List<Activity> get activities => _activities;

  Activity _activityDetail;
  Activity get activityDetail => _activityDetail;

  Future<void> loadActivities() async {
    try {
      _isLoading = true;
      notifyListeners();
      _activities = await repository.getRecentActivities();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addNewActivity(
    String name,
    String description,
    String location,
    String date,
    List<String> categories,
  ) async {
    try {
      _isLoading = true;
      notifyListeners();
      final request =
          ActivityRequest(name, description, categories, location, date);
      await repository.addNewActivity(request);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getDetailActivity(String id) async {
    try {
      _isLoading = true;
      notifyListeners();
      _activityDetail = await repository.getActivityDetail(id);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }
}
