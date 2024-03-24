import 'package:api/features/home_page.dart/widgets/atomic/preview_card_stack.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:card_swiper/card_swiper.dart';

import '../../../detail_page/ad_detail_page_view.dart';
import '../../../../product/model/ad_property_model.dart';

class PreviewCardDeck extends StatefulWidget {
  const PreviewCardDeck({Key? key}) : super(key: key);

  @override
  State<PreviewCardDeck> createState() => _PreviewCardDeckState();
}

class _PreviewCardDeckState extends State<PreviewCardDeck> {
  late Stream<List<AdPropertyModel>> _propertyAdsStream;

  @override
  void initState() {
    super.initState();
    _propertyAdsStream = fetchPropertyAds();
  }

  Stream<List<AdPropertyModel>> fetchPropertyAds() {
    return FirebaseFirestore.instance.collection('propertyAd').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => AdPropertyModel.fromJson(doc.data()))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<List<AdPropertyModel>>(
          stream: _propertyAdsStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator.adaptive();
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            final propertyAds = snapshot.data!;
            return Swiper(
              layout: SwiperLayout.STACK,
              itemCount: propertyAds.length,
              itemHeight: MediaQuery.of(context).size.height * 4 / 10,
              itemWidth: MediaQuery.of(context).size.width * 8 / 10,
              itemBuilder: (BuildContext context, int index) {
                final propertyAd = propertyAds[index];
                return PropertyAdCard(
                  adtitle: propertyAd.adDescription?.title ?? '',
                  imagePath: propertyAd.images![0],
                  onpressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AdDetailPage(adPropertyModel: propertyAd),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }
}
