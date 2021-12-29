
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  File? _image;

  // @override
  pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    setState(
          () {
        if (image != null) {
          _image = File(image.path);
          GallerySaver.saveImage(_image!.path, albumName: "My images");
        }
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child:const Icon(
          Icons.camera_alt,
        ),
        onPressed: () {
          pickImage(ImageSource.camera);
        },
      ),
      body: Builder(
        builder: (context) {
          return Center(
            child: Container(
              child:
              _image == null ?const Text("Take New Image") : Image.file(_image!),
            ),
          );
        },
      ),
    );
  }
}