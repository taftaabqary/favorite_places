import 'package:favorite_places/models/place_item.dart';
import 'package:favorite_places/provider/provider_favorite_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteAddScreen extends ConsumerStatefulWidget {
  const FavoriteAddScreen({super.key});

  @override
  ConsumerState<FavoriteAddScreen> createState() {
    return _FavoriteAddScreenState();
  }
}

class _FavoriteAddScreenState extends ConsumerState<FavoriteAddScreen> {
  final _titleController = TextEditingController();

  void savePlace() {
    ref.read(providerFavoritePlace.notifier).addNewPlace(
      PlaceItem(
          id: DateTime.now().toString(),
          title: _titleController.text
      )
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white
              ),
            ),
            const SizedBox(height: 14),
            ElevatedButton.icon(
                onPressed: savePlace,
                icon: const Icon(Icons.add),
                label: const Text('Add Place')
            )
          ],
        ),
      ),
    );
  }
}