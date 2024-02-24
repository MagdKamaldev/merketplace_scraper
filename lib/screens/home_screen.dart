// ignore_for_file: unused_local_variable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_scraper/models/response_body/response_body.dart';
import 'package:marketplace_scraper/networks/dio_helper.dart';
import 'package:marketplace_scraper/screens/response_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController queryTitleController = TextEditingController();
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();
  double radius = 50;
  double depth = 5;
  List<ResponseBody> items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: queryTitleController,
              decoration: const InputDecoration(
                labelText: 'Query Title',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: minPriceController,
              decoration: const InputDecoration(
                labelText: 'Minimum Price',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Maximum Price',
              ),
              controller: maxPriceController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            Slider(
              value: radius,
              min: 0,
              max: 2000,
              divisions: 1000,
              label: 'Radius',
              onChanged: (double value) {
                setState(() {
                  radius = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            Text('Radius: $radius'),
            const SizedBox(height: 16.0),
            Slider(
              value: depth,
              min: 1,
              max: 15,
              divisions: 14,
              label: 'Radius',
              onChanged: (double value) {
                setState(() {
                  depth = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            Text('Search depth: $depth'),
            const SizedBox(height: 100.0),
            ElevatedButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );

                DioHelper.postData(data: {
                  "query": queryTitleController.text,
                  "min_price": minPriceController.text,
                  "max_price": maxPriceController.text,
                  "radius": radius.toInt().toString(),
                  "depth": depth.toInt(),
                }).then((value) {
                 
                  items = (value.data as List)
                      .map((e) =>
                          ResponseBody.fromMap(e as Map<String, dynamic>))
                      .toList();
                       Navigator.pop(context);
                  navigateTo(context, ItemsScreen(items: items));
                });
              },
              child: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }

  void navigateTo(context, widget) => Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => widget,
      ));
}
