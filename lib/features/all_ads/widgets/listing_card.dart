import 'package:api/features/home_page.dart/widgets/atomic/add_to_favorites_button.dart';
import 'package:api/product/model/new_listing_model.dart';
import 'package:flutter/material.dart';
import '../../../product/enums/colors.dart';
import '../../../product/utility/app_sizes.dart';
import '../../../product/utility/paddings.dart';

class ListingCard extends StatelessWidget {
  const ListingCard({super.key, required this.listingModel});
  final NewListingModel listingModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPaddings.verticalPaddingMedium,
      child: Container(
        width: AppSizes.screenWidth,
        height: AppSizes.screenHeight / 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(30)),
          elevation: 5,
          child: Row(
            children: [
              _buildImage(),
              const SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: ProjectPaddings.pagepadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildListingTitle(context),
                      const SizedBox(height: 20),
                      _buildLocationText(),
                      const SizedBox(height: 25),
                      _buildPriceandButton(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Stack _buildImage() {
    return Stack(
      children: [
        Container(
          width: AppSizes.screenWidth / 2,
          height: AppSizes.screenHeight / 5,
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: ProjectColors.orange.color),
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                  image: NetworkImage(listingModel.images.first), fit: BoxFit.fitHeight)),
        ),
        const Positioned(right: 10, top: 10, child: AdtoFavoritesButton()),
      ],
    );
  }

  Text _buildListingTitle(BuildContext context) {
    return Text(
      listingModel.adDescription.title,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }

  Text _buildLocationText() {
    return Text(
      listingModel.propertyInformation.price,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  OutlinedButton _buildPriceandButton() {
    return OutlinedButton(onPressed: () {}, child: const Text(' BOOK '));
  }
}
