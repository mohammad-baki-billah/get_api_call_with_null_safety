import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_api_call_with_null_safety/pages/example_five/product_model.dart';
import 'package:http/http.dart' as http;

class ExampleFive extends StatefulWidget {
  const ExampleFive({super.key});

  @override
  State<ExampleFive> createState() => _ExampleFiveState();
}

class _ExampleFiveState extends State<ExampleFive> {
  //String productUrl ='https://webhook.site/ea2ed1f0-abf5-4939-b364-7ffee88cbc41';
  Future<ProductModel> getProductApi() async {
    final response = await http.get(
        Uri.parse('https://fakestoreapiserver.reactbd.com/smart'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductModel.fromJson(data);
    } else {
      return ProductModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<ProductModel>(
              future: getProductApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Display a loading spinner while waiting for data
                  return Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 5.0,
                      color: Colors.blue,
                      semanticsLabel: 'Loading..',
                    ),
                  );
                } else if (snapshot.hasError) {
                  // Display error message if there was an error
                  return Center(child: Text("Error fetching data"));
                } else if (!snapshot.hasData ||
                    snapshot.data!.data == null ||
                    snapshot.data!.data!.isEmpty) {
                  // Display a message if no data is available
                  return Center(child: Text("No data available"));
                } else {
                  // Render the list of data items
                  return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(snapshot.data!.data![index].price.toString()),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
