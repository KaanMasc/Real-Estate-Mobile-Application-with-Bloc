
import 'package:cloud_firestore/cloud_firestore.dart';

class AdPostRepository{

 final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addPropertyAd({
    required String title,
    required String description,
    required String categoryId,
    required String fullName,
    required String profilePicturePath,
    required List<String> images,
    required List<String> locationGeopoint,
  required String price,
    required String balconyCount,
    required String bathroomCount,
    required String bedroomCount,
    required String constructionYear,
    required String sqft,
  }) async {
    var adDescription = {
      "description": description,
      "title": title,
    };
    var contactInformation = {
      "fullName": fullName,
      "profilePicturePath": profilePicturePath,
    };
    var propertyInformation = {
      "balconyCount": balconyCount.toString(),
      "bathroomCount": bathroomCount.toString(),
      "bedroomCount": bedroomCount.toString(),
      "constructionYear": constructionYear,
      "sqft": sqft,
        "price": price,
    };

    await _firestore.collection("propertyAd").add({
      "adDescription": adDescription,
      "categoryID": categoryId,
      "contactInformation": contactInformation,
      "images": images,
      "locationGeopoint": locationGeopoint,
      
      "propertyInformation": propertyInformation,
    });
  }
}