import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_social_test/domain/models/activity.dart';
import 'package:go_social_test/features/activity_provider.dart';
import 'package:go_social_test/features/create/categories_selector.dart';
import 'package:go_social_test/service_locator.dart';
import 'package:go_social_test/widgets/go_button.dart';
import 'package:go_social_test/widgets/go_text_field.dart';
import 'package:provider/provider.dart';

class UpdateActivityScreen extends HookWidget {
  final Activity activity;
  const UpdateActivityScreen(this.activity, {Key key}) : super(key: key);

  static Future navigate(BuildContext context, Activity activity,
          {VoidCallback popCallback}) =>
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => UpdateActivityScreen._init(
            context,
            activity,
          ),
        ),
      ).then((_) => popCallback());

  static Widget _init(BuildContext context, Activity activity) {
    return ChangeNotifierProvider.value(
      value: getIt.get<ActivityProvider>(),
      child: UpdateActivityScreen(activity),
    );
  }

  @override
  Widget build(BuildContext context) {
    const NOT_EMPTY_FIELD = 'This field cannot be empty';
    final nameController = useTextEditingController(text: activity.name);
    final descriptionController =
        useTextEditingController(text: activity.description);
    final locationController =
        useTextEditingController(text: activity.location);
    final categoriesFormatted =
        activity.categories.map((i) => i.name).toList().join(',');
    final categoriesController =
        useTextEditingController(text: categoriesFormatted);
    final dateController = useTextEditingController(text: activity.date);
    final _formKey = GlobalKey<FormState>();
    final provider = Provider.of<ActivityProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update activity'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GoTextField(
                labelText: 'Name',
                controller: nameController,
                validator: (value) => value.isNotEmpty ? null : NOT_EMPTY_FIELD,
              ),
              const SizedBox(height: 20),
              GoTextField(
                labelText: 'Description',
                controller: descriptionController,
                maxLines: 3,
                validator: (value) => value.isNotEmpty ? null : NOT_EMPTY_FIELD,
              ),
              const SizedBox(height: 20),
              GoTextField(
                labelText: 'Location',
                controller: locationController,
                suffix: const Icon(Icons.map),
                validator: (value) => value.isNotEmpty ? null : NOT_EMPTY_FIELD,
              ),
              const SizedBox(height: 20),
              GoTextField(
                labelText: 'Date',
                controller: dateController,
                type: GoInputType.date,
                suffix: const Icon(Icons.date_range),
                validator: (value) => value.isNotEmpty ? null : NOT_EMPTY_FIELD,
              ),
              const SizedBox(height: 20),
              GoTextField(
                labelText: 'Categories',
                controller: categoriesController,
                readOnly: true,
                onTap: () => CategoriesSelector.show(
                  context,
                  onSelectionChanged: (categories) =>
                      categoriesController.text = categories.join(','),
                ),
                suffix: const Icon(Icons.category),
              ),
              const SizedBox(height: 40),
              GoButton(
                buttonText: 'Update',
                isLoading: provider.isLoading,
                onTap: () async {
                  if (_formKey.currentState.validate()) {
                    final updatedActivity = Activity(
                      id: activity.id,
                      name: nameController.text,
                      description: descriptionController.text,
                      location: locationController.text,
                      date: dateController.text,
                      categories: categoriesController.text
                          .split(',')
                          .map((item) => Category(item))
                          .toList(),
                      isUserActivity: activity.isUserActivity,
                      assitants: activity.assitants,
                    );
                    await provider.updateActivity(updatedActivity);
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
