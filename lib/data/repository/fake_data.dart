import 'package:go_social_test/domain/models/activity.dart';

var mockActivities = [
  Activity(
    id: 'id-1',
    name: 'Soccer match',
    description: LOREM_IPSUM_DESC,
    categories: [
      Category('Sports'),
    ],
    location: 'Santiago Bernabeu',
    date: '04-12-2021',
    assitants: 100,
    isUserActivity: true,
  ),
  Activity(
    id: 'id-2',
    name: 'Paint contest',
    description: LOREM_IPSUM_DESC,
    categories: [
      Category('Art'),
    ],
    location: 'Veterinary 1',
    date: '03-11-2021',
    assitants: 50,
    isUserActivity: false,
  ),
  Activity(
    id: 'id-3',
    name: 'Test activity',
    description: LOREM_IPSUM_DESC,
    categories: [
      Category('Nature'),
      Category('Party'),
      Category('Sports'),
      Category('Art'),
      Category('Music'),
      Category('Concert'),
    ],
    location: 'Springfield',
    date: '03-11-2021',
    assitants: 50,
    isUserActivity: true,
  ),
  Activity(
    id: 'id-4',
    name: 'Karaoke',
    description: LOREM_IPSUM_DESC,
    categories: [
      Category('Music'),
      Category('Party'),
    ],
    location: 'Scenario 2',
    date: '03-11-2021',
    assitants: 50,
    isUserActivity: false,
  ),
  ...artActivities,
  ...partyActivities,
  ...natureActivities,
  ...sportsActivities,
  ...musicActivities,
];

final artActivities = [
  for (var i = 1; i <= 10; i++)
    Activity(
      id: 'id-art-$i',
      name: 'Art contest $i',
      description: LOREM_IPSUM_DESC,
      categories: [
        Category('Art'),
      ],
      location: 'Salon art $i',
      date: '$i-12-2021',
      assitants: 100,
      isUserActivity: i % 2 == 0,
    ),
];

final partyActivities = [
  for (var i = 1; i <= 10; i++)
    Activity(
      id: 'id-party-$i',
      name: 'Disco party $i',
      description: LOREM_IPSUM_DESC,
      categories: [
        Category('Party'),
      ],
      location: 'Disco $i',
      date: '$i-12-2021',
      assitants: 100,
      isUserActivity: i % 2 == 0,
    ),
];

final natureActivities = [
  for (var i = 1; i <= 10; i++)
    Activity(
      id: 'id-nature-$i',
      name: 'Trekking mountains $i',
      description: LOREM_IPSUM_DESC,
      categories: [
        Category('Nature'),
      ],
      location: 'Mountain $i',
      date: '$i-12-2021',
      assitants: 100,
      isUserActivity: i % 2 == 0,
    ),
];

final sportsActivities = [
  for (var i = 1; i <= 10; i++)
    Activity(
      id: 'id-sports-$i',
      name: 'Sports challenge $i',
      description: LOREM_IPSUM_DESC,
      categories: [
        Category('Sports'),
      ],
      location: 'Stadium $i',
      date: '$i-12-2021',
      assitants: 100,
      isUserActivity: i % 2 == 0,
    ),
];

final musicActivities = [
  for (var i = 1; i <= 10; i++)
    Activity(
      id: 'id-music-$i',
      name: 'Music karaoke $i',
      description: LOREM_IPSUM_DESC,
      categories: [
        Category('Music'),
      ],
      location: 'Karaoke plaza $i',
      date: '$i-12-2021',
      assitants: 100,
      isUserActivity: i % 2 == 0,
    ),
];

const mockCategories = ['Sports', 'Music', 'Art', 'Nature', 'Party', 'Concert'];

const LOREM_IPSUM_DESC =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod'
    'tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim '
    'veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea'
    'commodo consequat. ';

const DEFAULT_IMAGE =
    'https://www.go.social/wp-content/uploads/2020/11/android_store_icon.png';

const CONCERT_IMAGE =
    'https://i.pinimg.com/originals/f8/14/76/f81476d56c8e38a1fd3a970028564e97.jpg';

const NATURE_IMAGE =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyx6BdkZj16C1z6x3z8wzE6Mm7E0X7w1SzXOsAZ9ifClKTJmffNfe3MnOQdzTFfuNgUVc&usqp=CAU';

const SPORTS_IMAGE =
    'https://www.mga.org.mt/wp-content/uploads/Sports-Integirty-.png';

const MUSIC_IMAGE =
    'https://thefoxmagazine.com/wp-content/uploads/2020/05/israel-palacio-Y20JJ_ddy9M-unsplash-1-scaled.jpg';

const ART_IMAGE =
    'http://feriadeartedelima.com/wp-content/uploads/2018/07/FotosMailchimpFDS-1024x550.jpg';

const PARTY_IMAGE =
    'https://s3-us-west-2.amazonaws.com/melingoimages/Images/69813.jpg';
