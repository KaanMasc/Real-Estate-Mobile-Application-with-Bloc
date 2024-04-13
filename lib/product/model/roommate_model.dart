// To parse this JSON data, do
//
//     final roomateModel = roomateModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

RoommateModel roomateModelFromJson(String str) => RoommateModel.fromJson(json.decode(str));

String roomateModelToJson(RoommateModel data) => json.encode(data.toJson());

class RoommateModel {
  final AdDescription adDescription;
  final String categoryId;
  final ContactInformation contactInformation;
  final List<GeoPoint> locationGeopoint;
  final String preferences;

  RoommateModel({
    required this.adDescription,
    required this.categoryId,
    required this.contactInformation,
    this.locationGeopoint = const [
      GeoPoint(0.0, 0.0),
    ], // Varsayılan bir GeoPoint listesi belirtildi
    required this.preferences,
  });

  factory RoommateModel.fromJson(Map<String, dynamic> json) {
    return RoommateModel(
      adDescription: json['adDescription'] != null
          ? AdDescription.fromJson(json['adDescription'])
          : AdDescription(description: '', title: ''),
      categoryId: json['categoryID'] ?? '',
      contactInformation: json['contactInformation'] != null
          ? ContactInformation.fromJson(json['contactInformation'])
          : ContactInformation(
              fulName: '', profilePicturePath: '', age: '', status: '', country: '', city: ''),
      preferences: json['preferences'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "adDescription": adDescription.toJson(),
        "categoryID": categoryId,
        "contactInformation": contactInformation.toJson(),
        "preferences": preferences,
      };
}

class AdDescription {
  final String description;
  final String title;

  AdDescription({
    required this.description,
    required this.title,
  });

  factory AdDescription.fromJson(Map<String, dynamic> json) => AdDescription(
        description: json["description"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "title": title,
      };
}

class ContactInformation {
  final String fulName;
  final String profilePicturePath;
  final String age;
  final String status;
  final String country;
  final String city;

  ContactInformation({
    required this.fulName,
    required this.profilePicturePath,
    required this.age,
    required this.status,
    required this.country,
    required this.city,
  });

  factory ContactInformation.fromJson(Map<String, dynamic> json) {
    return ContactInformation(
      fulName: json["fulName"] ?? "", // Null check added
      profilePicturePath: json["profilePicturePath"] ?? "", // Null check added
      age: json["age"] ?? "", // Null check added
      status: json["status"] ?? "", // Null check added
      country: json["country"] ?? "", // Null check added
      city: json["city"] ?? "", // Null check added
    );
  }

  Map<String, dynamic> toJson() => {
        "fulName": fulName,
        "profilePicturePath": profilePicturePath,
        "age": age,
        "status": status,
        "country": country,
        "city": city,
      };
}
