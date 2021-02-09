import 'package:flutter/material.dart';

class CreateButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CreateButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text('CREATE'),
      ),
      onPressed: onPressed,
    );
  }
}
