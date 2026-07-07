import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget cachedImageNetwork(url) {
  return CachedNetworkImage(
    fit: BoxFit.cover,
    imageUrl: url,
    placeholder: (context, url) => Shimmer.fromColors(
      baseColor: Colors.blueGrey.shade100,
      highlightColor: Colors.white,
      child: Container(
        color: Colors.blueGrey,
      ),
    ),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
