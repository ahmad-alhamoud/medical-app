import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ShowSvg extends StatelessWidget {
  final String path;
  final double width;
  final double height;
  final Color? color;
  final bool isNetworkSvg;
  const ShowSvg({
    required this.path,
    this.width = 16,
    this.height = 16,
    this.color, this.isNetworkSvg = false,
  });

  @override
  Widget build(BuildContext context) {
    final Widget svg = isNetworkSvg?
    SvgPicture.network(
      path,
      placeholderBuilder: (BuildContext context) => Container(
          padding: const EdgeInsets.all(30.0),
          child: const CircularProgressIndicator()),
    )
        :SvgPicture.asset(
      path,
      width: width,
      height: height,
      color: color,
    );
    return svg;
  }
}
