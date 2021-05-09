import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_social_test/data/repository/fake_data.dart';

typedef void OnCategorySelected(List<String> categories);

class CategoriesSelector extends HookWidget {
  final List<String> categories;
  final OnCategorySelected onSelectionChanged;

  const CategoriesSelector({Key key, this.categories, this.onSelectionChanged})
      : super(key: key);

  static void show(
    BuildContext context, {
    ValueChanged<List<String>> onSelectionChanged,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Add categories'),
          content: CategoriesSelector(
            categories: mockCategories,
            onSelectionChanged: (categories) => onSelectionChanged(categories),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('Save'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedCategories = useState<List<String>>([]);
    return Wrap(
      children: [
        for (var item in categories)
          Container(
            padding: const EdgeInsets.all(2.0),
            child: ChoiceChip(
              label: Text(item),
              selected: selectedCategories.value.contains(item),
              onSelected: (selected) {
                final newCategories = [...selectedCategories.value];
                selectedCategories.value.contains(item)
                    ? newCategories.remove(item)
                    : newCategories.add(item);
                selectedCategories.value = newCategories;
                onSelectionChanged(selectedCategories.value); // +added
              },
            ),
          )
      ],
    );
  }
}
