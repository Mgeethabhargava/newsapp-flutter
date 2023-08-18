// ignore_for_file: file_names
import "package:flutter/material.dart";

// ignore: must_be_immutable
class ThirdScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var data;
  ThirdScreen({super.key, required this.data});

  @override
  ThirdScreenState createState() => ThirdScreenState();
}

class ThirdScreenState extends State<ThirdScreen> {
  final String description = "";
  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                "NEWS",
                style: TextStyle(fontSize: 20),
              ),
            ),
            body: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.data["urlToImage"] == null
                    ? const Image(
                        image:
                            AssetImage('asset/images/no_image_available.jpg'),
                        height: 350.0,
                        width: 350.0)
                    : widget.data["urlToImage"] == ""
                        ? const Image(
                            image: AssetImage(
                                'asset/images/no_image_available.jpg'),
                            height: 350.0,
                            width: 350.0)
                        : Image.network(
                            widget.data["urlToImage"].toString(),
                            height: 350.0,
                            width: 350.0,
                          ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.data["title"],
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: widget.data["description"] == null
                    ? Text(
                        "",
                        style: const TextStyle(fontSize: 15),
                      )
                    : Text(
                        widget.data["description"],
                        style: const TextStyle(fontSize: 15),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: widget.data["content"] == null
                    ? Text(
                        "",
                        style: const TextStyle(fontSize: 15),
                      )
                    : Text(
                        widget.data["content"],
                        style: const TextStyle(fontSize: 15),
                      ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      widget.data["publishedAt"],
                      style: const TextStyle(fontSize: 18),
                    ),
                  )),
            ])));
  }
}
