import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:perfume_shop/utils/colors.dart';
import 'package:sizer/sizer.dart';

class ImageBanner extends StatelessWidget {
  final String imgUrl;
  const ImageBanner({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            clipBehavior: Clip.antiAlias,
            width: double.infinity,
            height: 20.h,
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              height: 20.h,
              width: double.infinity,
              fit: BoxFit.fill,
              placeholder:
                  (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget:
                  (context, url, error) => const Icon(
                    Icons.broken_image,
                    size: 40,
                    color: AppColors.greyColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
