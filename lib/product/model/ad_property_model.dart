// To parse this JSON data, do
//
//     final adPropertyModel = adPropertyModelFromJson(jsonString);

import 'dart:convert';

AdPropertyModel adPropertyModelFromJson(String str) => AdPropertyModel.fromJson(json.decode(str));

String adPropertyModelToJson(AdPropertyModel data) => json.encode(data.toJson());

class AdPropertyModel {
    final AdDescription? adDescription;
    final String? categoryId;
    final ContactInformation? contactInformation;
    final List<String>? images;
    final List<String>? geopoint;
    final PropertyInformation? propertyInformation;

    AdPropertyModel({
        this.adDescription,
        this.categoryId,
        this.contactInformation,
        this.images,
        this.geopoint,
        this.propertyInformation,
    });

    factory AdPropertyModel.fromJson(Map<String, dynamic> json) => AdPropertyModel(
        adDescription: json["adDescription"] == null ? null : AdDescription.fromJson(json["adDescription"]),
        categoryId: json["categoryID"],
        contactInformation: json["contactInformation"] == null ? null : ContactInformation.fromJson(json["contactInformation"]),
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
        geopoint: json["Geopoint"] == null ? [] : List<String>.from(json["Geopoint"]!.map((x) => x)),
        propertyInformation: json["propertyInformation"] == null ? null : PropertyInformation.fromJson(json["propertyInformation"]),
    );

    Map<String, dynamic> toJson() => {
        "adDescription": adDescription?.toJson(),
        "categoryID": categoryId,
        "contactInformation": contactInformation?.toJson(),
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "Geopoint": geopoint == null ? [] : List<dynamic>.from(geopoint!.map((x) => x)),
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
    final String? fullName;
    final String? profilePicturePath;

    ContactInformation({
        this.fullName,
        this.profilePicturePath,
    });

    factory ContactInformation.fromJson(Map<String, dynamic> json) => ContactInformation(
        fullName: json["fullName"],
        profilePicturePath: json["profilePicturePath"],
    );

    Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "profilePicturePath": profilePicturePath,
    };
}

class PropertyInformation {
    final String? price;
    final String? balconyCount;
    final String? bathroomCount;
    final String? bedroomCount;
    final String? constructionYear;
    final String? sqft;

    PropertyInformation({
        this.price,
        this.balconyCount,
        this.bathroomCount,
        this.bedroomCount,
        this.constructionYear,
        this.sqft,
    });

    factory PropertyInformation.fromJson(Map<String, dynamic> json) => PropertyInformation(
        price: json["price"],
        balconyCount: json["balconyCount"],
        bathroomCount: json["bathroomCount"],
        bedroomCount: json["bedroomCount"],
        constructionYear: json["constructionYear"],
        sqft: json["sqft"],
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
