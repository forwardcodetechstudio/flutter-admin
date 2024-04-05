import 'dart:io';
import 'dart:ui_web';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_admin/core/enum/page_display_enum.dart';
import 'package:flutter_admin/plugin/interfaces/file_pick_plugin.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickPluginImpl implements ImageFilePickPlugin {
  final BuildContext context;

  ImagePickPluginImpl(this.context);

  final ImagePicker _picker = ImagePicker();

  @override
  Future<List<File>> pickImageFile([bool pickMultiple = false]) async {
    List<File> pickedFile = [];

    if (!pickMultiple) {
      XFile? imagePick = await _picker.pickImage(source: ImageSource.gallery);
      if (imagePick != null) {
        pickedFile.add(File(imagePick.path));
      }
    } else {
      final List<XFile> images = await _picker.pickMultiImage();
      if (images.isNotEmpty) {
        images.asMap().forEach((index, value) {
          pickedFile.add(File(value.path));
        });
      }
    }
    return pickedFile;
  }

  @override
  Future<File?> cropSingleImage(File file,
      {PageDisplayStyle pageDisplayStyle = PageDisplayStyle.XL}) async {
    Size size = MediaQuery.of(context).size;
    var presentStyle = CropperPresentStyle.dialog;
    var boundary = CroppieBoundary(
      width: (size.width * 0.4).toInt(),
      height: (size.height * 0.55).toInt(),
    );
    var viewPort = CroppieViewPort(
      width: (size.width * 0.38).toInt(),
      height: (size.height * 0.50).toInt(),
    );

    log(pageDisplayStyle.toString());

    if (pageDisplayStyle == PageDisplayStyle.L) {
      boundary = CroppieBoundary(
        width: (size.width * 0.65).toInt(),
        height: (size.height * 0.55).toInt(),
      );
      viewPort = CroppieViewPort(
        width: (size.width * 0.66).toInt(),
        height: (size.height * 0.50).toInt(),
      );
    } else if (pageDisplayStyle == PageDisplayStyle.M) {
      boundary = CroppieBoundary(
        width: (size.width * 0.8).toInt(),
        height: (size.height * 0.7).toInt(),
      );
      viewPort = CroppieViewPort(
        width: (size.width * 0.75).toInt(),
        height: (size.height * 0.65).toInt(),
      );
    } else if (pageDisplayStyle == PageDisplayStyle.S) {
      presentStyle = CropperPresentStyle.page;
      boundary = CroppieBoundary(
        width: (size.width * 0.9).toInt(),
        height: (size.height * 0.75).toInt(),
      );
      viewPort = CroppieViewPort(
        width: (size.width * 0.8).toInt(),
        height: (size.height * 0.65).toInt(),
      );
    }

    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        WebUiSettings(
          context: context,
          presentStyle: presentStyle,
          boundary: boundary,
          viewPort: viewPort,
          enableExif: true,
          enableZoom: true,
          showZoomer: true,
        )
      ],
    );
    if (croppedFile != null) {
      return File(croppedFile.path);
    }
    return Future.value(null);
  }
}
