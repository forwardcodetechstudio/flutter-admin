import 'package:flutter_admin/features/tables/models/listing.dart';

List<Listing> dummyListings = [
  const Listing(
    id: '1',
    name: 'Example Business 1',
    user: 'john_doe',
    category: 'Restaurant',
    description: 'A cozy restaurant with a variety of cuisines.',
    website: 'http://www.example1.com',
    phone: '+1 (123) 456-7890',
    location: '123 Main Street, Cityville',
    latitude: '40.7128',
    longitude: '-74.0060',
    area: 'Downtown',
    services: 'Dine-in, Takeout',
    tags: 'Italian, Casual Dining',
    amenities: 'Free Wi-Fi, Parking',
    type: 'Food and Beverage',
    status: 'Open',
    googleId: 'abcdef123456',
  ),
  const Listing(
    id: '2',
    name: 'Example Business 2',
    user: 'jane_doe',
    category: 'Fitness',
    description: 'A modern fitness center with state-of-the-art equipment.',
    website: 'http://www.example2.com',
    phone: '+1 (987) 654-3210',
    location: '456 Fitness Avenue, Fitland',
    latitude: '34.0522',
    longitude: '-118.2437',
    area: 'Suburb',
    services: 'Gym, Personal Training',
    tags: 'Cardio, Strength Training',
    amenities: 'Sauna, Locker Rooms',
    type: 'Health and Wellness',
    status: 'Open',
    googleId: 'ghijkl789012',
  ),
];
