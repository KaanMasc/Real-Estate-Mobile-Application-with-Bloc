import 'dart:io';
import 'package:api/product/model/new_listing_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

abstract class IPropertyAdRepository {
  Future<List<NewListingModel>> fetchPropertyForSale();

  Future<List<dynamic>> fetchProperties(int type);
  Future<void> postListingToFirestore({
    required String title,
    required String description,
    required int categoryId,
    required List<File> images,
    required List<GeoPoint> locationGeopoint,
    required String bedroomCount,
    required String bathroomCount,
    required String balconyCount,
    required String constructionYear,
    required String price,
    required String sqft,
  });

  Future<void> deleteListingFromFirestore(String docId);
}

class PropertyAdRepository extends IPropertyAdRepository {
  @override
  Future<List<dynamic>> fetchProperties(int type) async {
    try {
      QuerySnapshot querySnapshot;
      switch (type) {
        case 1:
          querySnapshot = await FirebaseFirestore.instance.collection('propertyAd').get();
          return querySnapshot.docs
              .map((doc) => NewListingModel.fromJson(doc.data() as Map<String, dynamic>))
              .toList();
        case 2:
          querySnapshot = await FirebaseFirestore.instance.collection('propertyAdRent').get();
          return querySnapshot.docs;
        case 3:
          querySnapshot = await FirebaseFirestore.instance.collection('roomProperty').get();
          return querySnapshot.docs;
        default:
          throw 'Invalid property type.';
      }
    } catch (error) {
      throw 'There is an issue fetching properties. Please try again later.';
    }
  }

  @override
  Future<List<NewListingModel>> fetchPropertyForSale() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('propertyAd').get();
      return querySnapshot.docs
          .map((doc) => NewListingModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (error) {
      throw 'There is an issue fetching properties for sale. Please try again later.';
    }
  }

  @override
  Future<List<DocumentSnapshot>> fetchPropertyForRent() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('propertyAdRent').get();
      return querySnapshot.docs;
    } catch (error) {
      throw 'There is an issue fetching properties for rent. Please try again later.';
    }
  }

  @override
  Future<List<DocumentSnapshot>> fetchRoomProperties() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('roomProperty').get();
      return querySnapshot.docs;
    } catch (error) {
      throw 'There is an issue fetching room properties. Please try again later.';
    }
  }

  @override
  Future<void> postListingToFirestore({
    required String title,
    required String description,
    required int categoryId,
    required List<File> images,
    required List<GeoPoint> locationGeopoint,
    required String bedroomCount,
    required String bathroomCount,
    required String balconyCount,
    required String constructionYear,
    required String price,
    required String sqft,
  }) async {
    try {
      String collectionName;
      switch (categoryId) {
        case 1:
          collectionName = 'propertyAd';
          break;
        case 2:
          collectionName = 'propertyAdRent';
          break;
        case 3:
          collectionName = 'roomProperty';
          break;
        default:
          throw 'Invalid categoryId';
      }

      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection(collectionName);

      // Add Listing to Firestore
      DocumentReference docRef = await collectionReference.add({
        'adDescription': {
          'title': title,
          'description': description,
        },
        'categoryId': categoryId.toString(),
        'geopoint': locationGeopoint.map((geo) => GeoPoint(geo.latitude, geo.longitude)).toList(),
        'propertyInformation': {
          'price': price,
          'balconyCount': balconyCount,
          'bathroomCount': bathroomCount,
          'bedroomCount': bedroomCount,
          'constructionYear': constructionYear,
          'sqft': sqft,
        },
      });

      //Upload photo to Firebase Storage and then get the photo URL
      List<String> imageUrls = [];
      for (var imageFile in images) {
        String imageName = path.basename(imageFile.path);
        Reference ref = FirebaseStorage.instance.ref().child('images/$imageName');
        UploadTask uploadTask = ref.putFile(imageFile);
        TaskSnapshot taskSnapshot = await uploadTask;
        if (taskSnapshot.state == TaskState.success) {
        } else {
          throw 'Resim yüklenirken bir hata oluştu';
        }

        String downloadUrl = await taskSnapshot.ref.getDownloadURL();
        imageUrls.add(downloadUrl);
      }

      await docRef.update({'images': imageUrls});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteListingFromFirestore(String docId) async {
    try {
      String collectionName = '';
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection(collectionName);

      await collectionReference.doc(docId).delete();
    } catch (e) {
      throw 'There is an issue. Please try again later.';
    }
  }
}
