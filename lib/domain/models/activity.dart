import 'package:go_social_test/data/repository/fake_data.dart';

class Activity {
  final String id;
  final String name;
  final String description;
  final List<Category> categories;
  final String location;
  final String date;
  final int assitants;
  final bool isUserActivity;
  Activity({
    this.id,
    this.name,
    this.description,
    this.categories = const [],
    this.location,
    this.date,
    this.assitants,
    this.isUserActivity,
  });

  String getImageByCategories() {
    // This could be improved with key-value categories
    if (categories.isEmpty) return DEFAULT_IMAGE;

    final firstCategory = categories[0].name;
    switch (firstCategory) {
      case 'Sports':
        return SPORTS_IMAGE;
        break;
      case 'Music':
        return MUSIC_IMAGE;
        break;
      case 'Art':
        return ART_IMAGE;
        break;
      case 'Nature':
        return NATURE_IMAGE;
        break;
      case 'Party':
        return PARTY_IMAGE;
        break;
      case 'Concert':
        return CONCERT_IMAGE;
        break;
      default:
        return DEFAULT_IMAGE;
    }
  }
}

class Category {
  final String name;

  Category(this.name);
}
