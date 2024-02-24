import 'package:flutter/material.dart';
import 'package:marketplace_scraper/models/response_body/response_body.dart';

class ItemsScreen extends StatelessWidget {
  final List<ResponseBody> items;
  const ItemsScreen({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items Screen'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(items[index].node!.listing!.marketplaceListingTitle!),
            subtitle: Column(
              children: [
                Text(items[index]
                    .node!
                    .listing!
                    .listingPrice!
                    .amount
                    .toString()),
                const SizedBox(height: 10),
                Image.network(items[index]
                    .node!
                    .listing!
                    .primaryListingPhoto!
                    .image!
                    .uri!),
              ],
            ),
          );
        },
      ),
    );
  }
}
