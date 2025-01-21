import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Img extends StatelessWidget {
  final String imageUrl;

  final double height;
  final double width;

  const Img({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.contain,
        width: width,
        height: height,
        errorWidget: (context, url, error) => Center(
          child: Image(
            image: const AssetImage('assets/no_photo.png'),
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }
}
