import 'package:api/features/home_page.dart/widgets/atomic/add_to_favorites_button.dart';
import 'package:api/product/enums/colors.dart';
import 'package:api/product/utility/app_sizes.dart';
import 'package:flutter/material.dart';

class RoommateCard extends StatelessWidget {
  const RoommateCard(
      {super.key, required this.photoPath, required this.fulName, required this.location});
  final String photoPath;
  final String fulName;
  final String location;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Stack(
      children: [
        Container(
            height: AppSizes.screenHeight / 4,
            width: AppSizes.screenHeight * 2 / 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: ProjectColors.pagecolor.color)),
        Container(
          height: AppSizes.screenHeight / 4 * 2 / 3,
          width: AppSizes.screenHeight * 2 / 10,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(30)),
              image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(photoPath))),
        ),
        const Positioned(right: 5, top: 5, child: AdtoFavoritesButton()),
        Positioned(
          bottom: 0,
          child: Container(
            height: AppSizes.screenHeight / 12,
            width: AppSizes.screenHeight * 2 / 10,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    fulName,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.location_pin),
                    SizedBox(
                        child: Text(
                      location,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ))
                  ],
                )
              ],
            ),
          ),
        )
      ],
    )));
  }
}
