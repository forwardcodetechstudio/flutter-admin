import 'package:flutter/material.dart';

extension EmptySpace on num {
  SizedBox get sbw => SizedBox(width: toDouble());
  SizedBox get sbh => SizedBox(height: toDouble());
}
