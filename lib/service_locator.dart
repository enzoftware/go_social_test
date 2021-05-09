import 'package:get_it/get_it.dart';
import 'package:go_social_test/data/repository/activity_repository_impl.dart';
import 'package:go_social_test/domain/repository/activity_repository.dart';
import 'package:go_social_test/features/activity_provider.dart';

final getIt = GetIt.I;

void setupGetIt() {
  getIt.registerSingleton<ActivityRepository>(ActivityRepositoryImpl());
  getIt.registerSingleton<ActivityProvider>(
      ActivityProvider(getIt.get<ActivityRepository>()));
}
