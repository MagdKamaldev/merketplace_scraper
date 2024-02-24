import 'dart:convert';

class Image {
  String? uri;

  Image({this.uri});

  @override
  String toString() => 'Image(uri: $uri)';

  factory Image.fromMap(Map<String, dynamic> data) => Image(
        uri: data['uri'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'uri': uri,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Image].
  factory Image.fromJson(String data) {
    return Image.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Image] to a JSON string.
  String toJson() => json.encode(toMap());
}
