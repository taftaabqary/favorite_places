import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key, required this.onSelectedImage});

  final void Function(File) onSelectedImage;

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _selectedImage;

  void _takePicture() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera, maxWidth: 600, preferredCameraDevice: CameraDevice.front);

    if(image == null) {
      return;
    }

    setState(() {
      _selectedImage = File(image.path);
      widget.onSelectedImage(_selectedImage!);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takePicture,
      label: const Text('Take Picture'),
      icon: const Icon(Icons.camera),
    );

    if(_selectedImage != null) {
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          _selectedImage!,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      );
    }

    return Container(
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Theme.of(context).colorScheme.primary)
      ),
      height: 250,
      width: double.infinity,
      child: content,
    );
  }
}
