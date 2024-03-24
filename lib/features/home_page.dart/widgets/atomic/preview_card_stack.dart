// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:api/features/home_page.dart/widgets/atomic/add_to_favorites_button.dart';
import 'package:api/features/home_page.dart/widgets/atomic/direct_to_detailpage_button.dart';
import 'package:api/product/enums/colors.dart';

class PropertyAdCard extends StatelessWidget {
  const PropertyAdCard({
    Key? key,
    required this.adtitle,
    required this.imagePath,
    required this.onpressed,
  }) : super(key: key);
  final String adtitle;
  final String imagePath;
  final VoidCallback onpressed;
  final String label = 'Take a Look';
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 4 / 10,
      width: MediaQuery.of(context).size.width * 8 / 10,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                    image: NetworkImage(imagePath), fit: BoxFit.cover)),
          ),
          Center(
              child: SizedBox(
            height: MediaQuery.of(context).size.height * 7 / 20,
            width: MediaQuery.of(context).size.width * 7 / 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(adtitle,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: ProjectColors.white.color,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProjectCommonButton(
                      label: label,
                      backgroundColor: ProjectColors.white.color,
                      textcolor: ProjectColors.black.color,
                      onpressed: onpressed,
                    ),
                    const AdtoFavoritesButton()
                  ],
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
