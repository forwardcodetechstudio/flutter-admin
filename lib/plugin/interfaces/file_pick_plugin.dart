import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_admin/core/enum/page_display_enum.dart';
import 'package:flutter_admin/plugin/impl/image_pick_plugin_impl.dart';

abstract class FilePickPlugin {
  Future<List<File>> pickFile();
}

abstract class ImageFilePickPlugin {
  factory ImageFilePickPlugin.image(BuildContext context) =>
      ImagePickPluginImpl(context);

  Future<List<File>> pickImageFile();

  Future<File?> cropSingleImage(File file,
      {PageDisplayStyle pageDisplayStyle = PageDisplayStyle.XL});
}
