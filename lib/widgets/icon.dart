import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_clash/common/common.dart';
import 'package:flutter/material.dart';

class CommonIcon extends StatelessWidget {
  final String src;
  final double size;

  const CommonIcon({
    super.key,
    required this.src,
    required this.size,
  });

  Widget _defaultIcon() {
    return Icon(
      IconsExt.target,
      size: size,
    );
  }

  Widget _buildIcon() {
    if (src.isEmpty) {
      return _defaultIcon();
    }
    final base64 = src.getBase64;
    if (base64 != null) {
      return Image.memory(
        base64,
        errorBuilder: (_, error, ___) {
          return _defaultIcon();
        },
      );
    }
    return CachedNetworkImage(
      imageUrl: src,
      errorWidget: (_, __, ___) => _defaultIcon(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: _buildIcon(),
    );
  }
}
