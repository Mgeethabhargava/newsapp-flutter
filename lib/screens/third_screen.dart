// ignore_for_file: file_names
import "package:flutter/material.dart";

// ignore: must_be_immutable
class ThirdScreen extends StatefulWidget {
  final Map<String, dynamic> data;

  ThirdScreen({super.key, required this.data});

  @override
  ThirdScreenState createState() => ThirdScreenState();
}

class ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    final data = widget.data;
    final imageUrl = data["urlToImage"] as String?;
    final title = data["title"] ?? "No Title Available";
    final description = data["description"] ?? "No Description Available";
    final content = data["content"] ?? "No Content Available";
    final publishedAt = data["publishedAt"] ?? "No Date Available";

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "NEWS",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: imageUrl == null || imageUrl.isEmpty
                    ? const Image(
                        image:
                            AssetImage('assets/images/no_image_available.jpg'),
                        height: 350.0,
                        width: 350.0,
                      )
                    : Image.network(
                        imageUrl,
                        height: 350.0,
                        width: 350.0,
                        errorBuilder: (context, error, stackTrace) {
                          return const Image(
                            image: AssetImage(
                                'assets/images/no_image_available.jpg'),
                            height: 350.0,
                            width: 350.0,
                          );
                        },
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  content,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    publishedAt,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
