import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final picker = ImagePicker();

class ImageInput extends StatefulWidget {
  const ImageInput({
    super.key,
    required this.onPickImage,
  });

  final void Function(File file) onPickImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedFile;

  void _takePicture() async {
    final photo = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (photo == null) return;

    setState(() {
      _selectedFile = File(photo.path);
    });

    widget.onPickImage(_selectedFile!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takePicture,
      icon: const Icon(Icons.camera),
      label: const Text('Take picture'),
    );

    if (_selectedFile != null) {
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          _selectedFile!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }
    return Container(
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      child: content,
    );
  }
}
