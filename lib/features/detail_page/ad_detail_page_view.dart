import 'package:api/features/detail_page/widgets/ad_title_description_text.dart';
import 'package:api/features/detail_page/widgets/atomic/property_location_card.dart';
import 'package:api/features/home_page.dart/widgets/atomic/direct_to_detailpage_button.dart';
import 'package:api/features/detail_page/widgets/atomic/location_information_cards.dart';
import 'package:api/features/detail_page/widgets/atomic/property_owner_card.dart';
import 'package:api/product/enums/colors.dart';
import 'package:api/product/model/new_listing_model.dart';
import 'package:api/product/utility/app_sizes.dart';
import 'package:api/product/utility/paddings.dart';
import 'package:flutter/material.dart';

import 'widgets/general/propert_information_box_listview.dart';

class AdDetailPage extends StatelessWidget {
  const AdDetailPage({
    Key? key,
    required this.listingsModel,
  }) : super(key: key);

  final String label = 'Book Now';
  final ListingsModel listingsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: AppSizes.screenHeight * 4 / 10,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildImagePageView(listingsModel),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: ProjectPaddings.pagepadding,
                  child: Column(
                    children: [
                      Text('ABOUT', style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 20),
                      AdTitleDescription(
                        title: listingsModel.adDescription?.title ?? '',
                        description: listingsModel.adDescription?.description ?? '',
                      ),
                      const SizedBox(height: 20),
                      PropertyInformationListView(property: listingsModel),
                      const SizedBox(height: 20),
                      PropertyOwnerCard(
                        fulName: listingsModel.contactInformation?.fulName ?? '',
                        imagePath: listingsModel.contactInformation?.profilePicturePath ?? '',
                      ),
                      const SizedBox(height: 20),
                      const LocationInformationCards(),
                      const SizedBox(height: 20),
                      const PropertyLocationCard(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 1 / 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Spacer(),
                            OutlinedButton(
                              onPressed: null,
                              child: Text(
                                '${listingsModel.propertyInformation?.price ?? ''} \$',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            Spacer(),
                            ProjectCommonButton(
                              label: label,
                              backgroundColor: ProjectColors.black.color,
                              textcolor: ProjectColors.white.color,
                              onpressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PageView _buildImagePageView(ListingsModel newListingModel) {
    return PageView.builder(
      itemCount: newListingModel.images?.length,
      itemBuilder: (context, index) {
        final imageUrl = newListingModel.images?[index];
        return _buildImage(imageUrl);
      },
    );
  }

  Container _buildImage(String imagePath) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(image: NetworkImage(imagePath), fit: BoxFit.cover)),
    );
  }
}
