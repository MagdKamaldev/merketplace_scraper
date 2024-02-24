import 'dart:convert';

import 'listing_price.dart';
import 'primary_listing_photo.dart';

class Listing {
  String? id;
  String? marketplaceListingTitle;
  ListingPrice? listingPrice;
  PrimaryListingPhoto? primaryListingPhoto;

  Listing({
    this.id,
    this.marketplaceListingTitle,
    this.listingPrice,
    this.primaryListingPhoto,
  });

  @override
  String toString() {
    return 'Listing(id: $id, marketplaceListingTitle: $marketplaceListingTitle, listingPrice: $listingPrice, primaryListingPhoto: $primaryListingPhoto)';
  }

  factory Listing.fromMap(Map<String, dynamic> data) => Listing(
        id: data['id'] as String?,
        marketplaceListingTitle: data['marketplace_listing_title'] as String?,
        listingPrice: data['listing_price'] == null
            ? null
            : ListingPrice.fromMap(
                data['listing_price'] as Map<String, dynamic>),
        primaryListingPhoto: data['primary_listing_photo'] == null
            ? null
            : PrimaryListingPhoto.fromMap(
                data['primary_listing_photo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'marketplace_listing_title': marketplaceListingTitle,
        'listing_price': listingPrice?.toMap(),
        'primary_listing_photo': primaryListingPhoto?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Listing].
  factory Listing.fromJson(String data) {
    return Listing.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Listing] to a JSON string.
  String toJson() => json.encode(toMap());
}
