import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CircleImage extends StatelessWidget {
  String urlToImage;
  CircleImage({this.urlToImage});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: urlToImage ?? "",
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: imageProvider ?? "",
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
