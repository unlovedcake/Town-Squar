import 'package:cloud_firestore/cloud_firestore.dart';

class ActivitiesModel {
  final int availableSpots;
  final String category;
  final String duration;
  final String id;
  final String location;
  final String name;
  final int price;
  final List<String> size;
  List<String> joinedList = [];
  final DateTime time;

  ActivitiesModel({
    required this.availableSpots,
    required this.category,
    required this.duration,
    required this.id,
    required this.location,
    required this.name,
    required this.price,
    required this.size,
    this.joinedList = const [],
    required this.time,
  });

  // Factory method to create a ActivitiesModel from a JSON Map
  factory ActivitiesModel.fromJson(Map<String, dynamic> json) {
    return ActivitiesModel(
      availableSpots: json['available_spots'] ?? 0,
      category: json['category'] ?? '',
      duration: json['duration'] ?? '',
      id: json['id'] ?? '',
      location: json['location'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0.0,
      size: List<String>.from(json['size']),
      joinedList: List<String>.from(json['joined_list']),
      time: (json['time'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  // Method to convert ActivitiesModel to a JSON Map
  Map<String, dynamic> toJson() {
    return {
      'available_spots': availableSpots,
      'category': category,
      'duration': duration,
      'id': id,
      'location': location,
      'name': name,
      'price': price,
      'size': size,
      'joinedList': joinedList,
      'time': time,
    };
  }
}
