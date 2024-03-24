import 'package:flutter/material.dart';

class CustomFullNameField extends StatelessWidget {
  final TextEditingController controller;

  const CustomFullNameField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Email cannot be empty.";
          }

          return null;
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          labelText: 'Full Name',
        ));
  }
}
