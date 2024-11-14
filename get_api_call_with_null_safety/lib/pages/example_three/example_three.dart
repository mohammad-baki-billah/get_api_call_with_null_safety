import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_api_call_with_null_safety/pages/example_three/user_api_model.dart';
import 'package:http/http.dart' as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  List<UserApiModel> usersApi = [];
  Future<List<UserApiModel>> getUserApi() async {
    final response = await http.get(Uri.parse(apiUrl));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        usersApi.add(UserApiModel.fromJson(i));
      }
      return usersApi;
    } else {
      return usersApi;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getUserApi(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                  strokeWidth: 5.0,
                  semanticsLabel: 'Loading..',
                ),
              );
              // return Center(
              //   child: Text('Loading...'),
              // );
            } else {
              return ListView.builder(
                  itemCount: usersApi.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5.0,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name: ' + usersApi[index].name.toString()),
                            Text('Username: ' +
                                usersApi[index].username.toString()),
                            Text('Email: ' + usersApi[index].email.toString()),
                            Row(
                              children: [
                                ReusbleRow(
                                    title: 'Phone: ',
                                    value: usersApi[index].phone.toString()),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.location_on),
                                      Text(usersApi[index]
                                          .address!
                                          .city
                                          .toString()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}

class ReusbleRow extends StatelessWidget {
  final String title, value;
  const ReusbleRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}
