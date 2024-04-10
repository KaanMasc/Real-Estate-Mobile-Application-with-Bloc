import 'package:api/features/home_page.dart/widgets/atomic/preview_card_stack.dart';
import 'package:api/product/services/property_repository.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import '../../../detail_page/ad_detail_page_view.dart';

class PreviewCardDeck extends StatefulWidget {
  const PreviewCardDeck({Key? key}) : super(key: key);

  @override
  State<PreviewCardDeck> createState() => _PreviewCardDeckState();
}

class _PreviewCardDeckState extends State<PreviewCardDeck> {
  final IPropertyAdRepository _propertyAdService = PropertyAdRepository();

  late Future<List<dynamic>> _propertyAdsStream;

  @override
  void initState() {
    super.initState();
    _propertyAdsStream = _propertyAdService.fetchProperties(1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<List<dynamic>>(
          future: _propertyAdsStream,
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
                  adtitle: propertyAd.adDescription.title,
                  imagePath: propertyAd.images[0],
                  onpressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdDetailPage(adPropertyModel: propertyAd),
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
