import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_api_call_with_null_safety/pages/example_two/api_model.dart';
import 'package:http/http.dart' as http;

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  List<Photos> photosList = [];

  Future<List<Photos>> getPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        Photos photos = Photos(
            title: i['title'], url: i['url'], thumbnailUrl: i['thumbnailUrl']);
        photosList.add(photos);
      }
      return photosList;
    } else {
      return photosList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPhotos(),
              builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text('Loading...'),
                  );
                } else {
                  return ListView.builder(
                    itemCount: photosList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 05,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  snapshot.data![index].url.toString(),
                                ),
                              ),

                              //Text(snapshot.data![index].title.toString()),
                              Text(photosList[index].title.toString()),
                              Container(
                                height: 100,
                                child: Image.network(
                                  photosList[index].thumbnailUrl.toString(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
