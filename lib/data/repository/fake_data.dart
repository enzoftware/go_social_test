import 'package:go_social_test/domain/models/activity.dart';

var mockActivities = [
  Activity(
    id: 'id-1',
    name: 'Soccer match',
    description: 'Incredible soccer match',
    categories: [
      Category('Art'),
      Category('Sports'),
    ],
    location: 'Santiago Bernabeu',
    date: '04-12-2006',
    assitants: 100,
    isUserActivity: true,
  ),
  Activity(
    id: 'id-2',
    name: 'Pet contest',
    description: 'Most cute pet of the park',
    categories: [
      Category('Sports'),
    ],
    location: 'Veterinary 1',
    date: '03-11-2006',
    assitants: 50,
    isUserActivity: false,
  ),
];

const mockCategories = [
  'Sports',
  'Entertainment',
  'Music',
  'Art',
  'Videogames',
];
