import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListingProvider extends ChangeNotifier {
  late String _title;
  late String _description;
  int _categoryId = -1;
  final List<File> _images = [];
  final List<GeoPoint> _locationGeopoint = [];
  late String _bedroomCount;
  late String _bathroomCount;
  late String _balconyCount;
  late String _constructionYear;
  late String _price;
  late String _sqft;

  String get title => _title;
  String get description => _description;
  int get categoryId => _categoryId;
  List<File> get images => _images;
  List<GeoPoint> get geopoint => _locationGeopoint;
  String get bedroomCount => _bedroomCount;
  String get bathroomCount => _bathroomCount;
  String get balconyCount => _balconyCount;
  String get constructionYear => _constructionYear;
  String get price => _price;
  String get sqft => _sqft;
  bool get isLastStep => _categoryId != -1 && _images.isNotEmpty;

  void addImage(File image) {
    _images.add(image);
    notifyListeners();
  }

  void removeImage(File image) {
    _images.remove(image);
    notifyListeners();
  }

  void selectCcategoryID(int value) {
    _categoryId = value;
    notifyListeners();
  }

  void setAdDescription(Map<String, String> adDescription) {
    if (adDescription.containsKey('title')) _title = adDescription['title']!;
    if (adDescription.containsKey('description')) _description = adDescription['description']!;
    notifyListeners();
  }

  void setPropertyInformation(Map<String, String> propertyInformation) {
    if (propertyInformation.containsKey('price')) _title = propertyInformation['price']!;
    if (propertyInformation.containsKey('sqft')) _description = propertyInformation['sqft']!;
    if (propertyInformation.containsKey('bedroomCount'))
      _description = propertyInformation['bedroomCount']!;
    if (propertyInformation.containsKey('bathroomCount'))
      _description = propertyInformation['bathroomCount']!;
    if (propertyInformation.containsKey('balconyCount'))
      _description = propertyInformation['balconyCount']!;
    if (propertyInformation.containsKey('constructionYear'))
      _description = propertyInformation['constructionYear']!;

    notifyListeners();
  }

  void setTitle(String value) {
    _title = value;
    notifyListeners();
  }

  void setDescription(String value) {
    _description = value;
    notifyListeners();
  }

  void setBedroomCount(String value) {
    _bedroomCount = value;
    notifyListeners();
  }

  void setBathroomCount(String value) {
    _bathroomCount = value;
    notifyListeners();
  }

  void setBalconyCount(String value) {
    _balconyCount = value;
    notifyListeners();
  }

  void setPrice(String value) {
    _price = value;
    notifyListeners();
  }

  void setSqft(String value) {
    _sqft = value;
    notifyListeners();
  }

  void setConstructionYeae(String value) {
    _constructionYear = value;
    notifyListeners();
  }
}


/* void setValue<T>(String key, T value) {
  switch (key) {
    case 'title':
      _title = value as String;
      break;
    case 'description':
      _description = value as String;
      break;
    case 'bedroomCount':
      _bedroomCount = value as String;
      break;
    // Diğer durumlar için aynı işlemi yapabilirsiniz
    default:
      throw Exception('Geçersiz anahtar: $key');
  }
  notifyListeners();
}
listProvider.setValue('title', 'Yeni başlık');
listProvider.setValue('description', 'Yeni açıklama');
listProvider.setValue('bedroomCount', '3'); */