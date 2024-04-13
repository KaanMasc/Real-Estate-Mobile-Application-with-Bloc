import 'package:api/features/detail_page/ad_detail_page_view.dart';
import 'package:api/product/enums/colors.dart';
import 'package:api/product/mixins/mixin_connceciton_states.dart';
import 'package:api/product/services/property_repository.dart';
import 'package:api/product/utility/navigate.dart';
import 'package:api/product/utility/paddings.dart';
import 'package:flutter/material.dart';
import 'widgets/listing_card.dart';
import 'widgets/listings_page_header.dart';

class AllPropertyAdsPage extends StatelessWidget with ConnectionStates {
  const AllPropertyAdsPage({super.key, required this.type});
  final int type;
  @override
  Widget build(BuildContext context) {
    final IPropertyAdRepository _propertyRepository = PropertyAdRepository();
    return Scaffold(
      backgroundColor: ProjectColors.pagecolor.color,
      body: SafeArea(
        child: Padding(
          padding: ProjectPaddings.pagepadding,
          child: Column(
            children: [
              const ListingPageHeader(
                title: 'All Listing',
              ),
              const SizedBox(height: 10),
              Expanded(
                child: FutureBuilder(
                  future: _propertyRepository.fetchProperties(type),
                  builder: (context, AsyncSnapshot<List> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return connectionLoading();
                    } else if (snapshot.hasError) {
                      return connectionError();
                    } else {
                      final List listings = snapshot.data ?? [];

                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: listings.length,
                        itemBuilder: (context, index) {
                          return ListingCard(
                            listingModel: listings[index],
                            onTap: () {
                              navigateTo(context, AdDetailPage(listingsModel: listings[index]));
                            },
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
