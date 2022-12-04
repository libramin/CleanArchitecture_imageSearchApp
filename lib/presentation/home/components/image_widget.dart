import 'package:flutter/material.dart';

import '../../../domain/model/photo.dart';


class ImageWidget extends StatelessWidget {
  final Photo photo;
  const ImageWidget({Key? key,required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              image:
              NetworkImage(photo.previewURL))),
    );
  }
}
