import 'package:tinder_discover/domain/profile.dart';

class ProfileDTO {
  final String name;
  final int age;
  final String imageUrl;
  final int distanceKm;

  ProfileDTO({
    required this.name,
    required this.age,
    required this.imageUrl,
    required this.distanceKm,
  });

  // Factory constructor to create a ProfileDTO object from JSON
  factory ProfileDTO.fromJson(Map<String, dynamic> json) {
    return ProfileDTO(
      name: json['name'],
      age: json['age'],
      imageUrl: json['image_url'],
      distanceKm: json['distance_km'],
    );
  }

  // Method to convert a ProfileDTO object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'image_url': imageUrl,
      'distance_km': distanceKm,
    };
  }

  Profile toDomain() {
    return Profile(
      name: name,
      age: age,
      imageUrl: imageUrl,
      distanceKm: distanceKm,
    );
  }
}
