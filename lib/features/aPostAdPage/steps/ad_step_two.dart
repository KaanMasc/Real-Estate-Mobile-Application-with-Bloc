import 'package:api/features/aPostAdPAge/widget/widgets/direction_text.dart';
import 'package:api/features/aPostAdPAge/listing_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdStepTwo extends StatelessWidget {
  const AdStepTwo({super.key});
  final String _dirextionText = "Please provide a title and description for your listing.";
  @override
  Widget build(BuildContext context) {
    final listProvider = Provider.of<ListingProvider>(context, listen: false);
    return Column(
      children: [
        PostAdDirectionText(directionText: _dirextionText),
        const SizedBox(height: 50),
        TextField(
          onChanged: (value) {
            listProvider.setTitle(value);
          },
          decoration: InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
        ),
        const SizedBox(height: 25),
        TextField(
          onChanged: (value) {
            listProvider.setAdDescription({'description': value});
          },
          decoration: InputDecoration(
              labelText: 'Description',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
          maxLines: 15,
        ),
      ],
    );
  }
}
