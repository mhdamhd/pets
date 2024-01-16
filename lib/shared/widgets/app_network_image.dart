import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage(
      {super.key, required this.url, this.borderRadius, this.maxByte});
  final String url;
  final int? maxByte;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: ExtendedImage.network(
        url,
        fit: BoxFit.cover,
        cache: true,
        maxBytes: maxByte ?? 100000,
        loadStateChanged: (state) {
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.white,
                  child: Container(
                    color: Colors.white,
                    height: 200,
                  ));
            case LoadState.failed:
              return const Icon(Icons.report_gmailerrorred);
            default:
              return null;
          }
        },
      ),
    );
  }
}

