import 'package:flutter/material.dart';
import 'package:api/features/all_ads/all_property_ad_page.dart';
import 'package:api/product/utility/navigate.dart';
import 'package:api/features/home_page.dart/widgets/atomic/services_buton.dart';

class FilteredMenuSection extends StatelessWidget {
  FilteredMenuSection({Key? key}) : super(key: key);

  final List<String> _servicesList = [
    'Houses for Sale',
    'Houses for Rent',
    'Room for Rent',
    'Find Roommate',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 15,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _servicesList.length,
        itemBuilder: (context, index) {
          final title = _servicesList[index];
          return ServicesButton(
            title: title,
            onTap: () {
              navigateTo(
                context,
                AllPropertyAdsPage(
                    type:index +1), // Kategori ID'sini AllPropertyAdsPage'e iletiyoruz
              );
            },
          );
        },
      ),
    );
  }
}
