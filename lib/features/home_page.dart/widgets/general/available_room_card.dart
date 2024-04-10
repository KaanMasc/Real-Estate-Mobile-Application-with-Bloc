import 'package:api/features/home_page.dart/widgets/atomic/add_to_favorites_button.dart';
import 'package:api/product/enums/colors.dart';
import 'package:api/product/utility/app_sizes.dart';
import 'package:api/product/utility/paddings.dart';
import 'package:flutter/material.dart';

class AvailableRoomCard extends StatelessWidget {
  const AvailableRoomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.screenWidth / 3,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) => Padding(
                padding: ProjectPaddings.horizontalMedium,
                child: Stack(children: [
                  const Positioned(
                      top: 3, right: 3, child: AdtoFavoritesButton()),
                  Container(
                    height: AppSizes.screenHeight / 3,
                    width: AppSizes.screenWidth / 3,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: AppSizes.screenHeight / 25,
                      width: AppSizes.screenWidth / 3,
                      decoration: BoxDecoration(
                        color: ProjectColors.mortarGrey.color,
                        border: Border.all(),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.zero,
                          topRight: Radius.zero,
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: Center(child: Text('Available Room',style: TextStyle(color: ProjectColors.white.color),)),
                    ),
                  ),
                ]),
              )),
    );
  }
}
