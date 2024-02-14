import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/provider/provider_favorite_place.dart';
import 'package:favorite_places/widgets/image_picker.dart';
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
  File? _selectedImage;

  void _savePlace() {
    final titleValue = _titleController.text;

    if(titleValue.isEmpty || titleValue == " " || _selectedImage == null) {
      return ;
    }

    ref.read(favoritePlaceProvider.notifier).addNewPlace(
      titleValue,
      _selectedImage!
    );
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(label: Text('Title')),
                style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
              ),
              // ImagePicker
              const SizedBox(height: 14),
              ImagePickerWidget(
                onSelectedImage: (image) {
                  _selectedImage = image;
                },
              ),
              const SizedBox(height: 14),
              ElevatedButton.icon(
                  onPressed: _savePlace,
                  icon: const Icon(Icons.add),
                  label: const Text('Add Place')
              )
            ],
          ),
      ),
    );
  }
}