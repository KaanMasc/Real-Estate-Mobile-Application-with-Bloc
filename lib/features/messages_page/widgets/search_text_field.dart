import 'package:flutter/material.dart';

class SeachMessagesTextField extends StatelessWidget {
  const SeachMessagesTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: TextFormField(
        controller: TextEditingController(),
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            label: Text('Search'),
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
