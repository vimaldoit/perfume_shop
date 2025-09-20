import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:perfume_shop/data/models/brand_model.dart';
import 'package:perfume_shop/ui/common_widgets/heading_with_view_sec.dart';
import 'package:perfume_shop/utils/colors.dart';
import 'package:sizer/sizer.dart';

class BrandSec extends StatelessWidget {
  final List<Brands> brandsData;
  const BrandSec({super.key, required this.brandsData});

  @override
  Widget build(BuildContext context) {
    return brandsData.isNotEmpty
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: HeadingWithViewSec(
                heading: "Shop by brands",
                onPressed: () {},
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 30.w,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.borderColor),
                    ),
                    height: 30.w,
                    width: 30.w,
                    padding: EdgeInsets.all(10),
                    child: CachedNetworkImage(
                      imageUrl: brandsData[index].image.toString(),

                      placeholder:
                          (context, url) =>
                              Center(child: CircularProgressIndicator()),
                      errorWidget:
                          (context, url, error) => const Icon(
                            Icons.broken_image,
                            size: 40,
                            color: AppColors.greyColor,
                          ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 4.w);
                },
                itemCount: brandsData.length,
              ),
            ),
          ],
        )
        : SizedBox();
  }
}
