import 'dart:io';

import 'package:favorite_places_app/models/place_location.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Place {
  Place({
    required this.title,
    required this.imageFile,
    required this.location,
    String? id,
  }) : id = id ?? uuid.v4();

  final String id;
  final String title;
  File imageFile;
  final PlaceLocation location;
}
