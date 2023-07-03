import 'dart:convert';

class PlaceModel {
  String? address;
  Map<String, bool> categories;
  Map<String, String>? comments;
  String? description;
  String? mapsLocation;
  String? name;
  String? photo;
  int? rating;

  PlaceModel({
    this.address,
    this.categories = const {},
    this.comments,
    this.description,
    this.mapsLocation,
    this.name,
    this.photo,
    this.rating,
  });

  factory PlaceModel.fromMap(Map<String, dynamic> map) {
    return PlaceModel(
      address: map['address'] as String? ?? '',
      categories: map['categories']?.cast<String, bool>(),
      comments: map['comments']?.cast<String, String>(),
      description: map['description'] as String? ?? '',
      mapsLocation: map['mapsLocation'] as String? ?? '',
      name: map['name'] as String? ?? '',
      photo: map['photo'] as String? ?? '',
      rating: map['rating'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'categories': categories,
      'comments': comments,
      'description': description,
      'mapsLocation': mapsLocation,
      'name': name,
      'photo': photo,
      'rating': rating,
    };
  }

  String toString() {
    return jsonEncode(toMap());
  }

  factory PlaceModel.fromJson(String json) {
    return PlaceModel.fromMap(jsonDecode(json));
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}