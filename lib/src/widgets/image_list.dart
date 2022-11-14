import 'package:flutter/material.dart';
import 'package:flutter_image_list/src/models/image.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  const ImageList({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return Image.network(images[index].url);
      },
    );
  }
}
