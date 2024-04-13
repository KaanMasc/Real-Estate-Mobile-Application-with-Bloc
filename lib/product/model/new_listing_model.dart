// To parse this JSON data, do
//
//     final listingsModel = listingsModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart'
    as firestore;

ListingsModel listingsModelFromJson(String str) => ListingsModel.fromJson(json.decode(str));

String listingsModelToJson(ListingsModel data) => json.encode(data.toJson());

class ListingsModel {
  final AdDescription? adDescription;
  final String? categoryId;
  final ContactInformation? contactInformation;
  final List<dynamic>? images;
  final List<String>? locationGeopoint;
  final PropertyInformation? propertyInformation;

  ListingsModel({
    this.adDescription,
    this.categoryId,
    this.contactInformation,
    this.images,
    this.locationGeopoint,
    this.propertyInformation,
  });

  factory ListingsModel.fromJson(Map<String, dynamic> json) => ListingsModel(
        adDescription:
            json["adDescription"] == null ? null : AdDescription.fromJson(json["adDescription"]),
        categoryId: json["categoryID"],
        contactInformation: json["contactInformation"] == null
            ? null
            : ContactInformation.fromJson(json["contactInformation"]),
        images: json["images"] == null ? [] : List<dynamic>.from(json["images"]!.map((x) => x)),
        locationGeopoint: json["locationGeopoint"] == null
            ? []
            : [
                (json["locationGeopoint"] as firestore.GeoPoint).latitude.toString(),
                (json["locationGeopoint"] as firestore.GeoPoint).longitude.toString()
              ],
        propertyInformation: json["propertyInformation"] == null
            ? null
            : PropertyInformation.fromJson(json["propertyInformation"]),
      );

  Map<String, dynamic> toJson() => {
        "adDescription": adDescription?.toJson(),
        "categoryID": categoryId,
        "contactInformation": contactInformation?.toJson(),
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "locationGeopoint":
            locationGeopoint == null ? [] : List<dynamic>.from(locationGeopoint!.map((x) => x)),
        "propertyInformation": propertyInformation?.toJson(),
      };
}

class AdDescription {
  final String? description;
  final String? title;

  AdDescription({
    this.description,
    this.title,
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
  final String? fulName;
  final String? profilePicturePath;

  ContactInformation({
    this.fulName,
    this.profilePicturePath,
  });

  factory ContactInformation.fromJson(Map<String, dynamic> json) => ContactInformation(
        fulName: json["fulName"],
        profilePicturePath: json["profilePicturePath"],
      );

  Map<String, dynamic> toJson() => {
        "fulName": fulName,
        "profilePicturePath": profilePicturePath,
      };
}

class PropertyInformation {
  final String? balconyCount;
  final String? bathroomCount;
  final String? bedroomCount;
  final String? city;
  final String? constructionYear;
  final String? country;
  final String? price;
  final String? sqft;

  PropertyInformation({
    this.balconyCount,
    this.bathroomCount,
    this.bedroomCount,
    this.city,
    this.constructionYear,
    this.country,
    this.price,
    this.sqft,
  });

  factory PropertyInformation.fromJson(Map<String, dynamic> json) => PropertyInformation(
        balconyCount: json["balconyCount"],
        bathroomCount: json["bathroomCount"],
        bedroomCount: json["bedroomCount"],
        city: json["city"],
        constructionYear: json["constructionYear"],
        country: json["country"],
        price: json["price"],
        sqft: json["sqft"],
      );

  Map<String, dynamic> toJson() => {
        "balconyCount": balconyCount,
        "bathroomCount": bathroomCount,
        "bedroomCount": bedroomCount,
        "city": city,
        "constructionYear": constructionYear,
        "country": country,
        "price": price,
        "sqft": sqft,
      };
}
