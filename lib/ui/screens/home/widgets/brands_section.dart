import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:perfume_shop/data/models/brand_model.dart';
import 'package:perfume_shop/ui/common_widgets/heading_with_view_sec.dart';
import 'package:perfume_shop/utils/colors.dart';

class BrandSec extends StatelessWidget {
  final List<Brands> brandsData;
  const BrandSec({super.key, required this.brandsData});

  @override
  Widget build(BuildContext context) {
    return brandsData.isNotEmpty
        ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 20),
              HeadingWithViewSec(heading: "Shop by brands", onPressed: () {}),
              SizedBox(height: 15),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.borderColor),
                      ),
                      height: 100,
                      width: 100,
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
                    return SizedBox(width: 20);
                  },
                  itemCount: brandsData.length,
                ),
              ),
            ],
          ),
        )
        : SizedBox();
  }
}
