import 'package:flutter/material.dart';
import 'package:go_social_test/domain/models/activity.dart';
import 'package:go_social_test/features/activity_provider.dart';
import 'package:go_social_test/features/create/create_activity_screen.dart';
import 'package:go_social_test/features/list/activity_item.dart';
import 'package:go_social_test/service_locator.dart';
import 'package:provider/provider.dart';

class ActivityFeedScreen extends StatelessWidget {
  const ActivityFeedScreen({Key key}) : super(key: key);

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: getIt.get<ActivityProvider>()..loadActivities(),
      child: const ActivityFeedScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Selector<ActivityProvider, bool>(
        selector: (context, model) => model.isLoading,
        builder: (context, isLoading, _) {
          if (isLoading)
            return const Center(child: CircularProgressIndicator());
          else
            return ActivityFeedBody(
              activities: Provider.of<ActivityProvider>(context, listen: false)
                  .activities,
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => CreateActivityScreen.navigate(
          context,
          popCallback: () =>
              Provider.of<ActivityProvider>(context, listen: false)
                  .loadActivities(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ActivityFeedBody extends StatelessWidget {
  final List<Activity> activities;

  const ActivityFeedBody({Key key, this.activities}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (activities != null)
      return ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) =>
            ActivityItem(activity: activities[index]),
      );
    else
      return const Center(child: Text('Something goes wrong. Try again'));
  }
}
