// ignore_for_file: file_names
import "package:newsapp/screens/third_screen.dart";
import "package:flutter/material.dart";

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  final Map<String, dynamic> data;

  HomeScreen({super.key, required this.data});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String author = "News";

  @override
  Widget build(BuildContext context) {
    final articles = widget.data["articles"] ?? [];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(author, style: const TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: articles.isNotEmpty
          ? ListView.builder(
              itemCount: articles.length,
              itemBuilder: (BuildContext context, int index) {
                final article = articles[index];
                final imageUrl = article["urlToImage"] as String?;
                final title = article["title"] ?? "No Title";

                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ThirdScreen(data: article),
                      ),
                    );
                  },
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: imageUrl == null || imageUrl.isEmpty
                          ? const Image(
                              image: AssetImage(
                                  'assets/images/no_image_available.jpg'),
                              height: 100.0,
                              width: 100.0,
                            )
                          : Image.network(
                              imageUrl,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return const Image(
                                  image: AssetImage(
                                      'assets/images/no_image_available.jpg'),
                                  height: 100.0,
                                  width: 100.0,
                                );
                              },
                              height: 100.0,
                              width: 100.0,
                            ),
                    ),
                  ),
                  title: Text(title),
                );
              },
            )
          : const Center(child: Text("No articles available")),
    );
  }
}
