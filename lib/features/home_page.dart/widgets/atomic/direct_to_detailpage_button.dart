// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProjectCommonButton extends StatelessWidget {
  final String label;
  final VoidCallback onpressed;
  final Color backgroundColor;
  final Color textcolor;
  const ProjectCommonButton({
    Key? key,
    required this.label,
    required this.onpressed,
    required this.backgroundColor,
    required this.textcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 200,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: backgroundColor,
          foregroundColor: Colors.grey,
        ),
        onPressed: onpressed,
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: textcolor,
              ),
        ),
      ),
    );
  }
}
