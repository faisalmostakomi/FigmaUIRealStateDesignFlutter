import 'package:flutter/material.dart';

class SimpleChip extends StatelessWidget {
  final String label;
  SimpleChip(this.label);
  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(label));
  }
}
