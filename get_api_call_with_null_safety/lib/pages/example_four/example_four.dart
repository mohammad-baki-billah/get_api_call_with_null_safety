import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_api_call_with_null_safety/pages/example_four/api_model.dart';
import 'package:http/http.dart' as http;

class ExampleFour extends StatefulWidget {
  const ExampleFour({super.key});

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  String apiUrl = 'https://fakestoreapiserver.reactbd.com/photos';
  List<networkApi> modelApi = [];
  Future<List<networkApi>> getNetworApi() async {
    final response = await http.get(Uri.parse(apiUrl));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        modelApi.add(networkApi.fromJson(i));
      }
      return modelApi;
    } else {
      return modelApi;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getNetworApi(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: modelApi.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 5.0,
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Text('Title : ' +
                                        modelApi[index].title.toString()),
                                    Image.network(
                                      modelApi[index].url.toString(),
                                      height: 50,
                                    ),
                                    Image.network(
                                      modelApi[index].thumbnailUrl.toString(),
                                      height: 100,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    } else {
                      return Center(
                        child: Text('Loading...'),
                      );
                    }
                  }))
        ],
      ),
    );
  }
}
