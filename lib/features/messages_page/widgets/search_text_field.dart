import 'package:flutter/material.dart';

class SeachMessagesTextField extends StatelessWidget {
  const SeachMessagesTextField({super.key});
  final String _text = 'Search';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: TextFormField(
        controller: TextEditingController(),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            label: Text(_text),
            prefixIcon: const Icon(Icons.search)),
      ),
    );
  }
}
