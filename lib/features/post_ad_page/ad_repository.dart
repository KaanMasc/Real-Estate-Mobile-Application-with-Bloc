import 'package:cloud_firestore/cloud_firestore.dart';

class AdRepository {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance; 
  Future<void> createPropertyAd({
    required String title,
    required String description,
    required String categoryID,
    required List<String> images,
    required List<String> locationGeopoint,
    required String price,
    required Map<String, String> propertyInformation,
  }) async {
    try {
      final docRef = _firestore.collection('propertyAd').doc();
      await docRef.set({
        'adDescription': {
          'title': title,
          'description': description,
        },
        'categoryID': categoryID,
        'images': images,
        'locationGeopoint': locationGeopoint,
        'propertyInformation': propertyInformation,
      });
    } catch (e) {
      print('Error creating ad: $e');
    }
  }
}
