import 'dart:math';

import 'package:go_social_test/domain/models/activity.dart';

class ActivityRequest {
  final String name;
  final String description;
  final List<String> categories;
  final String location;
  final String date;

  ActivityRequest(
    this.name,
    this.description,
    this.categories,
    this.location,
    this.date,
  );

  Activity toActivity(String id) {
    return Activity(
      id: id,
      name: name,
      description: description,
      location: location,
      categories: categories.map((item) => Category(item)).toList(),
      date: date,
      assitants: Random().nextInt(1000),
      isUserActivity: true,
    );
  }
}
