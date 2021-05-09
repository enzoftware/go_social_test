import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_social_test/features/activity_provider.dart';
import 'package:go_social_test/features/create/categories_selector.dart';
import 'package:go_social_test/service_locator.dart';
import 'package:go_social_test/widgets/go_text_field.dart';
import 'package:provider/provider.dart';

class CreateActivityScreen extends HookWidget {
  const CreateActivityScreen({Key key}) : super(key: key);

  static Future navigate(BuildContext context, {VoidCallback popCallback}) =>
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => CreateActivityScreen._init(context)),
      ).then((_) => popCallback());

  static Widget _init(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: getIt.get<ActivityProvider>(),
      child: const CreateActivityScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    const NOT_EMPTY_FIELD = 'This field cannot be empty';
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final locationController = useTextEditingController();
    final categoriesController = useTextEditingController();
    final dateController = useTextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new activity'),
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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            await Provider.of<ActivityProvider>(context, listen: false)
                .addNewActivity(
              nameController.text,
              descriptionController.text,
              locationController.text,
              dateController.text,
              categoriesController.text.split(','),
            );
            Navigator.pop(context);
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
