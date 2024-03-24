/* import 'package:api/features/detail_page/ad_detail_page_view.dart';
import 'package:api/features/detail_page/dummydatas/ad_property_models_dummy.dart';
import 'package:api/features/home_page.dart/widgets/atomic/preview_card_stack.dart';
import 'package:api/features/home_page.dart/widgets/general/custom_page_indicator.dart';
import 'package:api/product/services/detail_page_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class PreviewCardDeck extends StatefulWidget {
  const PreviewCardDeck({super.key});

  @override
  State<PreviewCardDeck> createState() => _PreviewCardDeckState();
}

class _PreviewCardDeckState extends State<PreviewCardDeck> {

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
   
        Swiper(
          layout: SwiperLayout.STACK,
          itemCount:5,
          itemHeight: MediaQuery.of(context).size.height * 4 / 10,
          itemWidth: MediaQuery.of(context).size.width * 8 / 10,
          itemBuilder: (BuildContext context, int index) {
            final propertyad = properties[index];
            return PropertyAdCard(
              adtitle: propertyad.title,
              imagePath: propertyad.mainImagePath,
              onpressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdDetailPage(
                      adPropertyModel: properties[index],
                    ),
                  ),
                );
              },
            );
          },
          onIndexChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      const SizedBox(height: 20),
      CustomPageIndicator(
        onTabChanged: (option) {
          setState(() {
            selectedOption = option;
          });
        },
        selectedOption: selectedOption,
      ),
    ],
  );
    /* Column(
      children: [
        Swiper(
          layout: SwiperLayout.STACK,
          itemCount: properties.length ,
          itemHeight: MediaQuery.of(context).size.height * 4 / 10,
          itemWidth: MediaQuery.of(context).size.width * 8 / 10,
          itemBuilder: (BuildContext context, int index) {
            final propertyad = properties[index];
            return PropertyAdCard(
              adtitle: propertyad.title,
              imagePath: propertyad.mainImagePath,
              onpressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdDetailPage(
                            adPropertyModel: properties[index])));
              },
            );
          },
          onIndexChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        const SizedBox(height: 20),
        CustomPageIndicator(
          onTabChanged: (option) {
            setState(() {
              selectedOption = option;
            });
          },
          selectedOption: selectedOption,
        ),
      ],
    ); */
       
  }
}
 */