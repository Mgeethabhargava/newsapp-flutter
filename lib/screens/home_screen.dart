// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import "dart:convert";
import "package:newsapp/screens/second_screen.dart";
import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = "";
  String description = "";
  String author = "News";
  String urlToImage = "";
  String content = "";
  String publishedAt = "";
  // ignore: prefer_typing_uninitialized_variables
  var data;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "NEWS",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: //     Padding(
          //       padding: const EdgeInsets.all(10.0),
          //       child: Text(
          //         name,
          //         style: const TextStyle(fontSize: 20),
          //       ),
          //     ),
          //     // Padding(
          //     //   padding: const EdgeInsets.all(10.0),
          //     //   child: Image.network(
          //     //     urlToImage,
          //     //     errorBuilder: (BuildContext context, Object exception,
          //     //         StackTrace? stackTrace) {
          //     //       // Appropriate logging or analytics, e.g.
          //     //       // myAnalytics.recordError(
          //     //       //   'An error occurred loading "https://example.does.not.exist/image.jpg"',
          //     //       //   exception,
          //     //       //   stackTrace,
          //     //       // );
          //     //       return const Text('');
          //     //     },
          //     //   ),
          //     // ),
          //     Padding(
          //       padding: const EdgeInsets.all(10.0),
          //       child: Text(
          //         description,
          //         style: const TextStyle(fontSize: 20),
          //       ),
          //     ),
          //     Padding(
          //         padding: const EdgeInsets.only(right: 10.0),
          //         child: Align(
          //           alignment: Alignment.bottomRight,
          //           child: Text(
          //             publishedAt,
          //             style: const TextStyle(fontSize: 18),
          //           ),
          //         )),
          Center(
              child: ElevatedButton(
        onPressed: () async {
          var aourl =
              "https://newsapi.org/v2/top-headlines?country=in&apiKey=581e5be306914062b75716443d5abedc";
          var url = Uri.parse(aourl);
          var response = await http.get(url);
          if (response.statusCode == 200) {
            data = jsonDecode(response.body);
            // name = data["articles"][randomNumber]["title"];
            // description =
            //     data["articles"][randomNumber]["description"];
            // author = data["articles"][randomNumber]["source"]["name"];

            // urlToImage = data["articles"][randomNumber]["urlToImage"];
            // content = data["articles"][randomNumber]["content"];
            // publishedAt =
            //     data["articles"][randomNumber]["publishedAt"];
            // publishedAt = publishedAt.split("T")[0];

            // setState(() {
            //   AppBar(
            //     title: Text(
            //       author,
            //       style: const TextStyle(fontSize: 10),
            //     ),
            //   );
            // });
            // ignore: use_build_context_synchronously
            if (!context.mounted) return;
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => const SecondScreen(
            //         title: title,
            //         description: description,
            //         author: author,
            //         urlToImage: urlToImage,
            //         content: content,
            //         publishedAt: publishedAt)));
          } else {
            name = "None";
            description = "None";
            author = "None";
            urlToImage = "None";
            content = "None";
            publishedAt = "None";
            // if (!context.mounted) return;

            // setState(() {
            //   AppBar(
            //     title: Text(
            //       author,
            //       style: const TextStyle(fontSize: 10),
            //     ),
            //   );
            // });
            // ignore: use_build_context_synchronously
          }
          // ignore: use_build_context_synchronously
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SecondScreen(data: data)));
        },
        child: const Text("Get News"),
      )),
    ));
  }
}
