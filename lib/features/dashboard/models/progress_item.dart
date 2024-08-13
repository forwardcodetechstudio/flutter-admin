import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class ProgressItem extends Equatable {
  final String label;
  final double value;
  final Color? barColor;

  const ProgressItem({
    required this.label,
    required this.value,
    this.barColor,
  });

  @override
  List<Object?> get props => [
        label,
        value,
        barColor
      ];
}
