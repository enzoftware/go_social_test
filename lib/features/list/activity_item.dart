import 'package:flutter/material.dart';
import 'package:go_social_test/domain/models/activity.dart';
import 'package:go_social_test/widgets/decorations.dart';

class ActivityItem extends StatelessWidget {
  final Activity activity;

  const ActivityItem({Key key, this.activity}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: activityItemDecoration(activity.image),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              activity.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _ActvityInfo(
                  name: activity.location,
                  iconData: Icons.map,
                ),
                const SizedBox(width: 12),
                _ActvityInfo(
                  name: activity.date,
                  iconData: Icons.date_range_sharp,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: activity.categories
                  .map((item) => _CategoryItem(category: item))
                  .toList(),
            ),
            const SizedBox(height: 12),
            _ActivityAssistants(assitants: activity.assitants),
          ],
        ),
      ),
    );
  }
}

class _ActivityAssistants extends StatelessWidget {
  final int assitants;

  const _ActivityAssistants({Key key, this.assitants}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: assitants.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
          children: [
            const TextSpan(
              text: ' assitants',
              style: TextStyle(fontSize: 12),
            ),
          ]),
    );
  }
}

class _ActvityInfo extends StatelessWidget {
  final IconData iconData;
  final String name;

  const _ActvityInfo({Key key, this.iconData, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData),
        const SizedBox(width: 2),
        Text(name),
      ],
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final Category category;

  const _CategoryItem({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            category.name.toUpperCase(),
            style: const TextStyle(fontSize: 10),
          ),
        ),
      ),
    );
  }
}
