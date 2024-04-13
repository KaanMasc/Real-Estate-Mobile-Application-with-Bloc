import 'package:api/features/detail_page/ad_detail_page_view.dart';
import 'package:api/features/home_page.dart/widgets/atomic/add_to_favorites_button.dart';
import 'package:api/product/enums/colors.dart';
import 'package:api/product/mixins/mixin_connceciton_states.dart';
import 'package:api/product/services/property_repository.dart';
import 'package:api/product/utility/app_sizes.dart';
import 'package:api/product/utility/navigate.dart';
import 'package:api/product/utility/paddings.dart';
import 'package:flutter/material.dart';

class AvailableRoomCard extends StatelessWidget with ConnectionStates {
  const AvailableRoomCard({super.key});

  @override
  Widget build(BuildContext context) {
    final IPropertyAdRepository propertyRepository = PropertyAdRepository();
    return SizedBox(
      height: AppSizes.screenWidth / 3,
      width: double.infinity,
      child: FutureBuilder<List<dynamic>>(
        future: propertyRepository.fetchProperties(3),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return connectionLoading();
          } else if (snapshot.hasError) {
            return connectionError();
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return connectionError();
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final imageUrl = snapshot.data![index].images![0];
                return Padding(
                  padding: ProjectPaddings.horizontalMedium,
                  child: GestureDetector(
                    onTap: () {
                      navigateTo(context, AdDetailPage(listingsModel: snapshot.data![index]));
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: AppSizes.screenHeight / 3,
                          width: AppSizes.screenWidth / 3,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                            height: AppSizes.screenHeight / 25,
                            width: AppSizes.screenWidth / 3,
                            decoration: BoxDecoration(
                                color: ProjectColors.mortarGrey.color,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.zero,
                                    topRight: Radius.zero,
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25))),
                            child: Center(
                              child: Text(
                                'Available Room',
                                style: TextStyle(
                                  color: ProjectColors.white.color,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 3,
                          right: 3,
                          child: AdtoFavoritesButton(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
