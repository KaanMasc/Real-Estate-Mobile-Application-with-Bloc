import 'package:api/features/home_page.dart/widgets/atomic/services_buton.dart';
import 'package:flutter/material.dart';

class FilteredMenuSection extends StatelessWidget {
  FilteredMenuSection({super.key});
  final List<String> _servicesList = [
    'All Rooms',
    'All Roommates',
    'All Builders',
    'All Listing',
    'All Sellers',
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
          return ServicesButton(title: title);
        },
      ),
    );
  }
}
