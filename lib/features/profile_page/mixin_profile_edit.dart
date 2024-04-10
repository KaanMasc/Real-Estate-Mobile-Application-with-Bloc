import 'package:api/features/profile_page/profile_page_view_model.dart';
import 'package:flutter/material.dart';
mixin ProfileEdit on ProfilePageViewModel {
  Future<String?> editField(String field, context) async {
    String? newValue;
    newValue = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit $field"),
        content: TextFormField(
          decoration: InputDecoration(labelText: "New $field"),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, newValue);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
    
    return newValue; 
  }
}
