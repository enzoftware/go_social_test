import 'package:flutter/material.dart';
import 'package:go_social_test/features/list/activity_feed_screen.dart';
import 'package:go_social_test/service_locator.dart';

void main() {
  setupGetIt();
  runApp(const GoSocialApp());
}

class GoSocialApp extends StatelessWidget {
  const GoSocialApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Social',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ActivityFeedScreen.init(context),
    );
  }
}
