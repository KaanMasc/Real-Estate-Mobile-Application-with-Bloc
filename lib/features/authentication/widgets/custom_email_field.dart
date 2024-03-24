import 'package:flutter/material.dart';

class CustomEmailField extends StatelessWidget {
  final TextEditingController controller;

  const CustomEmailField({
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
          if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
              .hasMatch(value)) {
            return "Invalid email address.";
          }
          return null;
        },
        
        decoration: InputDecoration(
          prefixIcon:const Icon(Icons.email_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          labelText: 'E-Mail',
        ));
  }
}
