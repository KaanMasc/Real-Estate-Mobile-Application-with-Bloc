import 'package:api/features/aPostAdPAge/listing_provider.dart';
import 'package:api/product/services/property_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_ad_event.dart';
part 'post_ad_state.dart';

class PostAdBloc extends Bloc<PostAdEvent, PostAdStates> {
  final PropertyAdRepository _adRepository = PropertyAdRepository();
  final ListingProvider _listingProvider;

  PostAdBloc(this._listingProvider) : super(StepOne()) {
    on<NextPageEvent>((event, emit) {
      if (state is StepOne) {
        emit(StepTwo());
      } else if (state is StepTwo) {
        emit(StepThree());
      } else if (state is StepThree) {
        emit(StepFour());
      } else if (state is StepFour) {
        add(const PublishDataEvent());
      }
    });
    on<PreviousPageEvent>((event, emit) {
      if (state is StepTwo) {
        emit(StepOne());
      } else if (state is StepThree) {
        emit(StepTwo());
      } else if (state is StepFour) {
        emit(StepThree());
      }
    });

    on<PublishDataEvent>((event, emit) async {
      final title = _listingProvider.title;
      final description = _listingProvider.description;
      final categoryId = _listingProvider.categoryId;
      final images = _listingProvider.images;
      final locationGeopoint = _listingProvider.geopoint;
      final bedroomCount = _listingProvider.bedroomCount;
      final bathroomCount = _listingProvider.bathroomCount;
      final balconyCount = _listingProvider.balconyCount;
      final constructionYear = _listingProvider.constructionYear;
      final price = _listingProvider.price;
      final sqft = _listingProvider.sqft;
      emit(PostzieLoading());
      try {
        await _adRepository.postListingToFirestore(
          title: title,
          description: description,
          categoryId: categoryId,
          images: images,
          locationGeopoint: locationGeopoint,
          bedroomCount: bedroomCount,
          bathroomCount: bathroomCount,
          balconyCount: balconyCount,
          constructionYear: constructionYear,
          price: price,
          sqft: sqft,
        );
        emit(PostzieSucces());
      } catch (e) {
        emit(PostzieError());
      }
    });
  }
}
