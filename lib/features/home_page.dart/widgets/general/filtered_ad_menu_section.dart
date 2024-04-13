import 'package:flutter/material.dart';
import 'package:api/features/all_ads/all_property_ad_page.dart';
import 'package:api/product/utility/navigate.dart';
import 'package:api/features/home_page.dart/widgets/atomic/services_buton.dart';

import '../../../roommates_page/rommates_page_view.dart';

class FilteredMenuSection extends StatelessWidget {
  FilteredMenuSection({Key? key}) : super(key: key);

  final List<String> _servicesList = [
    'Houses for Sale',
    'Houses for Rent',
    'Room for Rent',
    'Find Roommate',
  ];
  final List<int> _serviceTypes = [1, 2, 3]; // Her bir servis türüne karşılık gelen tamsayılar

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
                if (_servicesList[index] == 'Houses for Sale') {
                  // "Houses for Sale" tıklandıysa
                  navigateTo(context, AllPropertyAdsPage(type: 1));
                } else if (_servicesList[index] == 'Houses for Rent') {
                  // "Houses for Rent" tıklandıysa
                  navigateTo(context, AllPropertyAdsPage(type: 2));
                } else if (_servicesList[index] == 'Room for Rent') {
                  // "Room for Rent" tıklandıysa
                  navigateTo(context, AllPropertyAdsPage(type: 3));
                } else if (_servicesList[index] == 'Find Roommate') {
                  // "Find Roommate" tıklandıysa
                  navigateTo(context, RoommatePageView());
                }
              });
        },
      ),
    );
  }
}
