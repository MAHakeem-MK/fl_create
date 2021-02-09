import 'package:flutter/material.dart';

class ProjectDetailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;

  const ProjectDetailTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        hintText: hint,
      ),
      cursorWidth: 10.0,
    );
  }
}