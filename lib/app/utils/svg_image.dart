import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SVGImage extends StatelessWidget {
  final String imagePath;
  final ImageType imageType;
  final double? height;
  final double? width;
  const SVGImage(
      {Key? key,
      required this.imagePath,
      required this.imageType,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return imageType == ImageType.svg
        ? SvgPicture.asset(
            imagePath,
            fit: BoxFit.scaleDown,
            height: height ?? 33,
            width: width ?? 33,
          )
        : SvgPicture.network(imagePath);
  }
}


enum ImageType{
  svg, network
}