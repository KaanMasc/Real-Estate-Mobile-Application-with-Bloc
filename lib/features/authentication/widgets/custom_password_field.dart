import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  const CustomPasswordField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isObscured,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password cannot be empty.";
        }
        if (value.length < 6) {
          return "Password must be at least 6 characters long.";
        }
        return null; // Geçerli
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        labelText: 'Password',
        prefixIcon: const Icon(Icons.lock_outlined),
        suffixIcon: IconButton(
          icon: Icon(
            isObscured ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              isObscured = !isObscured;
            });
          },
        ),
      ),
    );
  }
}
