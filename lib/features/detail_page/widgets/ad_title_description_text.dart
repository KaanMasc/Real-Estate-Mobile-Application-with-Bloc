import 'package:api/product/enums/colors.dart';
import 'package:flutter/material.dart';

class AdTitleDescription extends StatefulWidget {
  const AdTitleDescription({Key? key, required this.title, required this.description})
      : super(key: key);

  final String title;
  final String description;

  @override
  State<AdTitleDescription> createState() => _AdTitleDescriptionState();
}

class _AdTitleDescriptionState extends State<AdTitleDescription> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          expanded = !expanded;
        });
      },
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            Text(
              expanded
                  ? widget.description
                  : widget.description.substring(
                      0, widget.description.length > 50 ? 50 : widget.description.length),
            ),
            if (widget.description.length > 50 && !expanded)
              Text(
                '... See More',
                style: TextStyle(
                  color: ProjectColors.purple.color,
                  decoration: TextDecoration.underline,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
