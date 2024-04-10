import 'package:api/features/detail_page/widgets/atomic/property_information_box.dart';
import 'package:api/product/model/new_listing_model.dart';
import 'package:flutter/material.dart';

import '../../../../product/model/ad_property_model.dart';

class PropertyInformationListView extends StatelessWidget {
  final NewListingModel property;

  const PropertyInformationListView({Key? key, required this.property})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Row(
            children: [
              PropertyInformationBox(
                number: property.propertyInformation?.bedroomCount.toString() ??
                    '?',
                icon: Icons.bedroom_parent_outlined,
              ),
              SizedBox(width: 10),
              PropertyInformationBox(
                number:
                    property.propertyInformation?.bathroomCount.toString() ??
                        '?',
                icon: Icons.bathroom_outlined,
              ),
              SizedBox(width: 10),
              PropertyInformationBox(
                number: property.propertyInformation?.balconyCount.toString() ??
                    '?',
                icon: Icons.balcony_outlined,
              ),
              SizedBox(width: 10),
              PropertyInformationBox(
                number:
                    '${property.propertyInformation?.bedroomCount ?? '?'} sqft',
                icon: Icons.square_foot_outlined,
              ),
              SizedBox(width: 10),
              PropertyInformationBox(
                number:
                    property.propertyInformation?.constructionYear.toString() ??
                        '?',
                icon: Icons.handyman_outlined,
              ),
            ],
          );
        },
      ),
    );
  }
}
