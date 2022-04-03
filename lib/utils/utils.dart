import 'dart:typed_data';
import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource imageSource) async {
  var imagePicker = ImagePicker();
  var file = await imagePicker.pickImage(source: ImageSource.gallery);

  if (file != null) {
    return await file.readAsBytes();
  }
}

showSnackbar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(seconds: 2),
  ));
}
