import 'dart:convert';

class ListingPrice {
  String? amount;

  ListingPrice({this.amount});

  @override
  String toString() => 'ListingPrice(amount: $amount)';

  factory ListingPrice.fromMap(Map<String, dynamic> data) => ListingPrice(
        amount: data['amount'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'amount': amount,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ListingPrice].
  factory ListingPrice.fromJson(String data) {
    return ListingPrice.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ListingPrice] to a JSON string.
  String toJson() => json.encode(toMap());
}
