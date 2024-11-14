import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_api_call_with_null_safety/pages/example_one/api_model.dart';
import 'package:get_api_call_with_null_safety/pages/example_one/second_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ApiModel> apiModel = [];

  Future<List<ApiModel>> getApiModel() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        apiModel.add(ApiModel.fromJson(i));
      }
      return apiModel;
    } else {
      return apiModel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getApiModel(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: Text('Loading...'));
                } else {
                  return ListView.builder(
                    itemCount: apiModel.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SecondPage(
                                          title:
                                              apiModel[index].body.toString(),
                                        ))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Title : \n' +
                                      apiModel[index].title.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.blue),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(apiModel[index].body.toString()),
                              ],
                            ),
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
