import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/asset_constants.dart';
import '../shimmer/shimmer_base.dart';

class CachedNetworkImageCustom extends StatelessWidget {
  final String imageUrl;
  final double height, width;
  final bool isProfilePhoto;

  const CachedNetworkImageCustom(
      {Key? key,
      required this.imageUrl,
      this.isProfilePhoto = false,
      this.height = 114,
      this.width = 114})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: isProfilePhoto ? BoxFit.cover : BoxFit.cover,
      placeholder: (context, url) => ShimmerBase(
        child: Container(
          height: height,
          width: width,
          color: AppColors.liteGray,
        ),
      ),
      errorWidget: (context, url, error) => Image.asset(
        isProfilePhoto ? profilePhotoErrorImage : appLogo,
        height: height,
        width: width,
        fit: isProfilePhoto ? BoxFit.cover : BoxFit.contain,
      ),

      // placeholder: "assets/png/future_nation_logo.png",
    );
  }
}
