import 'package:flutter/material.dart';
import 'package:flutter_image_list/src/models/image.dart';
import 'package:flutter_image_list/src/widgets/image_list.dart';
import 'package:http/http.dart';
import 'dart:convert';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    var url = Uri.http('jsonplaceholder.typicode.com', 'photos/$counter');
    var result = await get(url);
    var imageModel = ImageModel.fromJson(json.decode(result.body));
    setState(() => images.add(imageModel));
  }

  @override
  build(context) {
    return MaterialApp(
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Image List App'),
        ),
        body: ImageList(images: images),
      ),
    );
  }
}
