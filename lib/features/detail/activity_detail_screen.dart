import 'package:flutter/material.dart';
import 'package:go_social_test/domain/models/activity.dart';
import 'package:go_social_test/features/activity_provider.dart';
import 'package:go_social_test/features/list/activity_item.dart';
import 'package:go_social_test/features/update/update_activity_screen.dart';
import 'package:go_social_test/service_locator.dart';
import 'package:go_social_test/widgets/go_button.dart';
import 'package:provider/provider.dart';

class ActivityDetailScreeen extends StatelessWidget {
  final String id;

  const ActivityDetailScreeen({Key key, this.id}) : super(key: key);

  static Widget _init(BuildContext context, String id) {
    return ChangeNotifierProvider.value(
      value: getIt.get<ActivityProvider>()..getDetailActivity(id),
      builder: (context, _) => const ActivityDetailScreeen(),
    );
  }

  static Future navigate(BuildContext context, String id) =>
      showModalBottomSheet(
        context: context,
        builder: (context) => ActivityDetailScreeen._init(context, id),
      );

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ActivityProvider>(context, listen: true);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _ActivityDetailHeader(activity: provider.activityDetail),
                  const SizedBox(height: 48),
                  const Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(provider.activityDetail.description),
                  const SizedBox(height: 16),
                  if (provider.activityDetail.isUserActivity)
                    GoButton(
                      buttonText: 'Edit',
                      onTap: () async {
                        UpdateActivityScreen.navigate(
                          context,
                          provider.activityDetail,
                          popCallback: () {
                            provider.getDetailActivity(id);
                            Navigator.pop(context);
                          },
                        );
                      },
                      isLoading: provider.isLoading,
                    )
                ],
              ),
            ),
    ));
  }
}

class _ActivityDetailHeader extends StatelessWidget {
  final Activity activity;

  const _ActivityDetailHeader({Key key, this.activity}) : super(key: key);
  static const IMAGE_SIZE = 100.0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: IMAGE_SIZE,
          height: IMAGE_SIZE,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                activity.getImageByCategories(),
              ),
            ),
          ),
        ),
        const SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              activity.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 8),
            ActvityInfo(iconData: Icons.location_city, name: activity.location),
            ActvityInfo(iconData: Icons.calendar_today, name: activity.date),
          ],
        )
      ],
    );
  }
}
