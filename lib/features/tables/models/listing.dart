import 'package:equatable/equatable.dart';

class Listing extends Equatable {
  // '#',  // for id or serial no
  final String id;
  final String name;
  final String user;
  final String category;
  final String description;
  final String website;
  final String phone;
  final String location;
  final String latitude;
  final String longitude;
  final String area;
  final String services;
  final String tags;
  final String amenities;
  final String type;
  final String status;
  final String googleId;

  const Listing({
    required this.id,
    required this.name,
    required this.user,
    required this.category,
    required this.description,
    required this.website,
    required this.phone,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.area,
    required this.services,
    required this.tags,
    required this.amenities,
    required this.type,
    required this.status,
    required this.googleId,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        user,
        category,
        description,
        website,
        phone,
        location,
        latitude,
        longitude,
        area,
        services,
        tags,
        amenities,
        type,
        status,
        googleId,
      ];
}
