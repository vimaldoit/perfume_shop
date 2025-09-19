import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:perfume_shop/data/models/categories_model.dart';
import 'package:perfume_shop/ui/common_widgets/heading_with_view_sec.dart';
import 'package:perfume_shop/utils/colors.dart';
import 'package:sizer/sizer.dart';

class CategorySec extends StatelessWidget {
  final List<Categories> categories;

  const CategorySec({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final random = Random();

    // List of light background colors
    final bgColors = [
      Colors.pink.shade100,
      Colors.blue.shade100,
      Colors.green.shade100,
      Colors.orange.shade100,
      Colors.purple.shade100,
      Colors.yellow.shade100,
      Colors.teal.shade100,
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(height: 20),
          HeadingWithViewSec(heading: "Our Categories", onPressed: () {}),
          SizedBox(height: 15),
          GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: categories.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              final bgColor = bgColors[random.nextInt(bgColors.length)];
              final category = categories[index];
              return Column(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: CachedNetworkImage(
                        imageUrl: category.image ?? '',
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,

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
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    category.name ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
