import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              image:
              NetworkImage('https://picsum.photos/200'))),
    );
  }
}
