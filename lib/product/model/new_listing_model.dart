import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

NewListingModel newListingModelFromJson(String str) => NewListingModel.fromJson(json.decode(str));

String newListingModelToJson(NewListingModel data) => json.encode(data.toJson());

class NewListingModel {
  final AdDescription adDescription;
  final String categoryId;
  final List<String> images;
  final List<GeoPoint> geopoint;
  final PropertyInformation propertyInformation;

  NewListingModel({
    required this.adDescription,
    required this.categoryId,
    required this.images,
    required this.geopoint,
    required this.propertyInformation,
  });

  factory NewListingModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    if (data == null) {
      throw Exception('Document snapshot is null');
    }

    return NewListingModel(
      adDescription: AdDescription.fromJson(data['adDescription']),
      categoryId: data['categoryId'] ?? '',
      images: List<String>.from(data['images'] ?? []),
      geopoint: (data['geopoint'] as List<dynamic>).map((geo) {
        return geo is GeoPoint
            ? geo
            : GeoPoint((geo as Map<String, dynamic>)['latitude'] as double,
                (geo as Map<String, dynamic>)['longitude'] as double);
      }).toList(),
      propertyInformation: PropertyInformation.fromJson(data['propertyInformation']),
    );
  }

  factory NewListingModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException("Json data is null");
    }
    return NewListingModel(
      adDescription: AdDescription.fromJson(json["adDescription"]),
      categoryId: json["categoryID"] ?? '', // Varsayılan olarak boş bir dize atandı
      images: List<String>.from(json["images"]), // String listesi olarak alınması gerekiyor
      geopoint:
          json["Geopoint"] != null ? (json["Geopoint"] as List<dynamic>).cast<GeoPoint>() : [],
      propertyInformation: PropertyInformation.fromJson(json["propertyInformation"]),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'adDescription': adDescription.toJson(),
      'categoryId': categoryId,
      'images': images,
      'propertyInformation': propertyInformation.toJson(),
    };
  }
}

class AdDescription {
  final String description;
  final String title;

  AdDescription({
    required this.description,
    required this.title,
  });

  factory AdDescription.fromJson(Map<String, dynamic> json) => AdDescription(
        description: json["description"] != null ? json["description"] as String : '',
        title: json["title"] != null ? json["title"] as String : 'Your Perfect Home',
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "title": title,
      };
}

class PropertyInformation {
  final String price;
  final String balconyCount;
  final String bathroomCount;
  final String bedroomCount;
  final String constructionYear;
  final String sqft;

  PropertyInformation({
    required this.price,
    required this.balconyCount,
    required this.bathroomCount,
    required this.bedroomCount,
    required this.constructionYear,
    required this.sqft,
  });

  factory PropertyInformation.fromJson(Map<String, dynamic> json) => PropertyInformation(
        price: json["price"],
        balconyCount: json["balconyCount"],
        bathroomCount: json["bathroomCount"],
        bedroomCount: json["bedroomCount"],
        constructionYear: json["constructionYear"],
        sqft: json["sqft"] as String? ?? 'unknown',
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "balconyCount": balconyCount,
        "bathroomCount": bathroomCount,
        "bedroomCount": bedroomCount,
        "constructionYear": constructionYear,
        "sqft": sqft,
      };
}
