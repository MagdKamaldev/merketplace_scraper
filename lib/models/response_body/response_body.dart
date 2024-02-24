import 'dart:convert';

import 'node.dart';

class ResponseBody {
  Node? node;

  ResponseBody({this.node});

  @override
  String toString() => 'ResponseBody(node: $node)';

  factory ResponseBody.fromMap(Map<String, dynamic> data) => ResponseBody(
        node: data['node'] == null
            ? null
            : Node.fromMap(data['node'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'node': node?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ResponseBody].
  factory ResponseBody.fromJson(String data) {
    return ResponseBody.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ResponseBody] to a JSON string.
  String toJson() => json.encode(toMap());
}
