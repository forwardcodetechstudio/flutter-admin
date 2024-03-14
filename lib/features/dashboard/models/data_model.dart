import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DataModel extends Equatable {
  final Months x;
  final double y;
  final Color color;

  const DataModel({
    required this.x,
    required this.y,
    required this.color,
  });

  @override
  List<Object?> get props => [x, y];
}

enum Months {
  jan('Jan'),
  feb('Feb'),
  mar('Mar'),
  apr('Apr'),
  may('May'),
  jun("Jun"),
  jul('Jul'),
  aug('Aug'),
  sep('Sep'),
  oct('Oct'),
  nov('Nov'),
  dec('Dec');

  final String name;

  const Months(this.name);
}

final sampleData = [
  const DataModel(x: Months.jan, y: 10, color: Colors.blue),
  const DataModel(x: Months.feb, y: 40, color: Colors.red),
  const DataModel(x: Months.mar, y: 35, color: Colors.green),
  const DataModel(x: Months.apr, y: 50, color: Colors.yellow),
  const DataModel(x: Months.may, y: 46, color: Colors.orange),
  const DataModel(x: Months.jul, y: 60, color: Colors.pink),
  const DataModel(x: Months.aug, y: 70, color: Colors.purple),
  const DataModel(x: Months.sep, y: 100, color: Colors.deepOrange),
];
