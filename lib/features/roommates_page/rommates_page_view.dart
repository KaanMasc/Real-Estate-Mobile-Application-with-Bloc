import 'package:api/features/all_ads/widgets/listings_page_header.dart';
import 'package:api/features/roommates_page/widgets/roommate_card.dart';
import 'package:api/product/mixins/mixin_connceciton_states.dart';
import 'package:api/product/model/roommate_model.dart';
import 'package:api/product/services/roommate_repository.dart';
import 'package:api/product/utility/app_sizes.dart';
import 'package:api/product/utility/paddings.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RoommatePageView extends StatelessWidget with ConnectionStates {
  RoommatePageView({Key? key}) : super(key: key);
  final RoommateRepository _repository = RoommateRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ListingPageHeader(
              title: 'All Rommates',
            ),
            Expanded(
              child: StreamBuilder<List<RoommateModel>>(
                stream: _repository.streamRoommates(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return connectionLoading();
                  } else if (snapshot.hasError) {
                    return connectionError();
                  } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return connectionError();
                  } else {
                    final List<RoommateModel> roommates = snapshot.data!;
                    return GridView.builder(
                      scrollDirection: Axis.vertical,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 0.50,
                        crossAxisSpacing: 0.5,
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: roommates.length,
                      itemBuilder: (BuildContext context, int index) {
                        final RoommateModel roommate = roommates[index];
                        return RoommateCard(
                          fulName: roommate.contactInformation.fulName,
                          location:
                              "${roommate.contactInformation.city} / ${roommate.contactInformation.country}",
                          photoPath: roommate.contactInformation.profilePicturePath,
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
    );
  }
}
