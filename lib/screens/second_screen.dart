import 'package:flutter/material.dart';
import "package:newsapp/screens/third_screen.dart";

// ignore: must_be_immutable
class SecondScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var data;
  SecondScreen({super.key, required this.data});

  @override
  SecondScreenState createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  final String author = "Headlines";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                context,
              );
            }),
        title: Text(author, style: const TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: widget.data["articles"].length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ThirdScreen(data: widget.data["articles"][index])));
                },
                leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: widget.data["articles"][index]["urlToImage"] ==
                              null
                          ? const Image(
                              image: AssetImage(
                                  'asset/images/no_image_available.jpg'),
                              height: 100.0,
                              width: 100.0,
                            )
                          : widget.data["articles"][index]["urlToImage"] == ""
                              ? const Image(
                                  image: AssetImage(
                                      'asset/images/no_image_available.jpg'),
                                  height: 100.0,
                                  width: 100.0,
                                )
                              : Image.network(
                                  widget.data["articles"][index]["urlToImage"]
                                      .toString(),
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    // Appropriate logging or analytics, e.g.
                                    // myAnalytics.recordError(
                                    //   'An error occurred loading "https://example.does.not.exist/image.jpg"',
                                    //   exception,
                                    //   stackTrace,
                                    // );
                                    return const Text('');
                                  },
                                  height: 100.0,
                                  width: 100.0,
                                ),
                    )),
                // trailing: const Text(
                //   "Read More",
                //   style: TextStyle(color: Colors.green, fontSize: 15),
                // ),
                title: Text(widget.data["articles"][index]["title"]));
          }),
    );
  }
}
