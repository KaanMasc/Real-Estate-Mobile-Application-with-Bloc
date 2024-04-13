import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:api/product/model/roommate_model.dart';

class RoommateRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

 Stream<List<RoommateModel>> streamRoommates() {
    return _firestore
        .collection('roommates')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => RoommateModel.fromJson(doc.data())).toList());
        
  }

  Future<void> addToFavorites(String roomId, String userId) async {
    try {
      await _firestore.collection('favorites').doc(userId).collection('roommates').doc(roomId).set({
        'roomId': roomId,
        'userId': userId,
        'timestamp': DateTime.now(),
      });
    } catch (e) {
      print("Error adding to favorites: $e");
    }
  }
}
