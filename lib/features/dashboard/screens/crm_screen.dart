import 'package:flutter/material.dart';

class CRMScreen extends StatelessWidget {
  const CRMScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(color: Colors.red, width: 100, height: 100),
        Container(color: Colors.blue, width: 100, height: 100),
        Container(color: Colors.green, width: 100, height: 100),
        Container(color: Colors.yellow, width: 100, height: 100),
        Container(color: Colors.orange, width: 100, height: 100),
      ],
    );
  }
}
