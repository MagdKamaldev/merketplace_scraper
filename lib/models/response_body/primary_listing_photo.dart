import 'dart:convert';

import 'image.dart';

class PrimaryListingPhoto {
  Image? image;

  PrimaryListingPhoto({this.image});

  @override
  String toString() => 'PrimaryListingPhoto(image: $image)';

  factory PrimaryListingPhoto.fromMap(Map<String, dynamic> data) {
    return PrimaryListingPhoto(
      image: data['image'] == null
          ? null
          : Image.fromMap(data['image'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'image': image?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PrimaryListingPhoto].
  factory PrimaryListingPhoto.fromJson(String data) {
    return PrimaryListingPhoto.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PrimaryListingPhoto] to a JSON string.
  String toJson() => json.encode(toMap());
}
