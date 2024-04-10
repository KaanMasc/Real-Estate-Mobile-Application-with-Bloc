import 'dart:io';
import 'package:api/product/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class IUserRepository {
  Future<UserModel?> getUserData(String uid);
  Future<void> updateProfilePicture(String uid, File profilePicture);
  Future<void> updateFullName(String uid, String fullName);
  Future<void> updateBio(String uid, String bio);
  Future<void> updateEmail(String uid, String email);
  Future<void> deleteUserAccount(String uid);
}

class UserRepository extends IUserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  

  @override
  Future<UserModel?> getUserData(String uid) async {
    try {
      final snapshot = await _firestore.collection("users").doc(uid).get();

      if (snapshot.exists) {
        final data = snapshot.data();
        return UserModel.fromMap(data!);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

 

  @override
  Future<void> updateFullName(String uid, String fullName) async {
    try {
      await _firestore.collection("users").doc(uid).update({
        'fullName': fullName,
      });
    } catch (e) {
      throw Exception("Failed to update full name: $e");
    }
  }

  @override
  Future<void> updateBio(String uid, String bio) async {
    try {
      await _firestore.collection("users").doc(uid).update({
        'bio': bio,
      });
    } catch (e) {
      throw Exception("Failed to update bio: $e");
    }
  }

  @override
  Future<void> updateEmail(String uid, String email) async {
    try {
      await _firestore.collection("users").doc(uid).update({
        'email': email,
      });
    } catch (e) {
      throw Exception("Failed to update email: $e");
    }
  }

  @override
  Future<void> updateProfilePicture(String uid, File profilePicture) async {
    try {
      UploadTask uploadTask = _storage
          .ref()
          .child('userProfilePictures/$uid/profilePicture.jpg')
          .putFile(profilePicture);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String downloadURL = await taskSnapshot.ref.getDownloadURL();

      await _firestore.collection("users").doc(uid).update({
        'photoURL': downloadURL,
      });
    } catch (e) {
      throw Exception("Failed to update profile picture: $e");
    }
  }

  @override
  Future<void> deleteUserAccount(String uid) async {
    try {
      await _firestore.collection("users").doc(uid).delete();
    } catch (e) {
      throw Exception("Failed to delete user account: $e");
    }
  }
}
