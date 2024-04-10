import 'dart:io';
import 'package:api/features/aPostAdPAge/widget/widgets/direction_text.dart';
import 'package:api/features/aPostAdPAge/listing_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';


class AdStepFour extends StatelessWidget {
  AdStepFour({Key? key}) : super(key: key);
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final listProvider = Provider.of<ListingProvider>(context, listen: false);
    Future<void> pickImage(ImageSource source) async {
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        final file = File(pickedFile.path);
        listProvider.addImage(file);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PostAdDirectionText(directionText: "Please upload photos of the listing."),
        const SizedBox(height: 20),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              final listProvider = Provider.of<ListingProvider>(context);
              if (listProvider.images.isNotEmpty && index < listProvider.images.length) {
                final file = listProvider.images[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.file(file, fit: BoxFit.cover),
                  ),
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    pickImage(ImageSource.gallery);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.camera_alt,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
