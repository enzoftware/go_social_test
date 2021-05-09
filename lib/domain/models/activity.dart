class Activity {
  final String id;
  final String name;
  final String description;
  final List<Category> categories;
  final String location;
  final String date;
  final String image;
  final int assitants;
  final bool isUserActivity;

  Activity({
    this.id,
    this.name,
    this.description,
    this.categories,
    this.location,
    this.date,
    this.image =
        'https://losangeles.cbslocal.com/wp-content/uploads/sites/14984641/2015/12/guidetoeuropeansoccer_photocredit_laurencegriffiths.jpg',
    this.assitants,
    this.isUserActivity,
  });
}

class Category {
  final String name;

  Category(this.name);
}
