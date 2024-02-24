import 'dart:convert';

import 'listing.dart';

class Node {
  Listing? listing;

  Node({this.listing});

  @override
  String toString() => 'Node(listing: $listing)';

  factory Node.fromMap(Map<String, dynamic> data) => Node(
        listing: data['listing'] == null
            ? null
            : Listing.fromMap(data['listing'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'listing': listing?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Node].
  factory Node.fromJson(String data) {
    return Node.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Node] to a JSON string.
  String toJson() => json.encode(toMap());
}
