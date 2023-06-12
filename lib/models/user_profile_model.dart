import 'package:flutter/foundation.dart';

@immutable
class UserProfileModel {
  final String bio;
  final int connectionCount;
  final String name;
  final Map<String, bool> preferences;
  final String profilePicture;

  const UserProfileModel({
    this.bio = "",
    this.connectionCount = 0,
    this.name = "",
    this.preferences = const {"null": false},
    this.profilePicture = "",
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      bio: json['bio'] as String,
      connectionCount: json['connectionCount'] as int,
      name: json['name'] as String,
      preferences: json['preferences'] as Map<String, bool>,
      profilePicture: json['profilePicture'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bio': bio,
      'connectionCount': connectionCount,
      'name': name,
      'preferences': preferences,
      'profilePicture': profilePicture,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'bio': bio,
      'connectionCount': connectionCount,
      'name': name,
      'preferences': preferences,
      'profilePicture': profilePicture,
    };
  }

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      bio: map['bio'] as String? ?? "",
      connectionCount: map['connection_count'] as int? ?? 0,
      name: map['name'] as String? ?? "",
      preferences:
          map['preferences'].cast<String, bool>() as Map<String, bool>? ??
              {"null": false},
      profilePicture: map['profile_picture'] as String? ?? "",
    );
  }

  @override
  String toString() {
    return '''
    UserProfile {
      bio: $bio,
      connectionCount: $connectionCount,
      name: $name,
      preferences: $preferences,
      profilePicture: $profilePicture,
    ''';
  }
}
