import 'dart:io';

import 'package:favorite_places_app/models/place.dart';
import 'package:favorite_places_app/models/place_location.dart';
import 'package:favorite_places_app/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/user_places.dart';
import '../widgets/location_input.dart';

class AdPlaceScreen extends ConsumerStatefulWidget {
  const AdPlaceScreen({super.key});

  @override
  ConsumerState<AdPlaceScreen> createState() {
    return _AdPlaceScreenState();
  }
}

class _AdPlaceScreenState extends ConsumerState<AdPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImageFile;
  PlaceLocation? _selectedLocation;

  void _savePlace() {
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty ||
        _selectedImageFile == null ||
        _selectedLocation == null) return;

    ref
        .read(
          userPlacesProvider.notifier,
        )
        .addPlace(
          Place(
            title: enteredTitle,
            imageFile: _selectedImageFile!,
            location: _selectedLocation!,
          ),
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
        title: const Text(
          'Add new place',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 35),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 10),
            ImageInput(
              onPickImage: (File file) {
                _selectedImageFile = file;
              },
            ),
            const SizedBox(height: 10),
            LocationInput(
              onSelectLocation: (location) {
                _selectedLocation = location;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
              label: const Text('Add place'),
            )
          ],
        ),
      ),
    );
  }
}
