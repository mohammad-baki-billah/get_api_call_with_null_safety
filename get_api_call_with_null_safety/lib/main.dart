import 'package:flutter/material.dart';
import 'package:get_api_call_with_null_safety/Post_Api/example_one/sign_up_api.dart';
import 'package:get_api_call_with_null_safety/pages/example_five/example_five.dart';
import 'package:get_api_call_with_null_safety/pages/example_four/example_four.dart';
import 'package:get_api_call_with_null_safety/pages/example_one/home_page.dart';
import 'package:get_api_call_with_null_safety/pages/example_three/example_three.dart';
import 'package:get_api_call_with_null_safety/pages/example_two/example_Two.dart';
import 'package:get_api_call_with_null_safety/put/example_one/put_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PutImage(),
    );
  }
}
