import 'package:newsapp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

Future<Map<String, dynamic>> getNews() async {
  var url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=");
  try {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      return {"status": "error", "message": "Failed to load news"};
    }
  } catch (e) {
    return {"status": "error", "message": e.toString()};
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<Map<String, dynamic>>(
        future: getNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError ||
              !snapshot.hasData ||
              snapshot.data!["status"] == "error") {
            return const Center(child: Text("Error loading news"));
          } else {
            print(snapshot.data);
            return HomeScreen(data: snapshot.data!);
          }
        },
      ),
    );
  }
}
