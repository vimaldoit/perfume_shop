import 'package:flutter/material.dart';
import 'package:perfume_shop/data/models/product_model.dart';
import 'package:perfume_shop/ui/common_widgets/heading_with_view_sec.dart';
import 'package:perfume_shop/ui/screens/home/widgets/product_item_tile.dart';
import 'package:perfume_shop/utils/colors.dart';
import 'package:sizer/sizer.dart';

class ProductCollectionSec extends StatelessWidget {
  final List<Products> productList;
  final String title;
  const ProductCollectionSec({
    super.key,
    required this.productList,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: HeadingWithViewSec(heading: title, onPressed: () {}),
        ),
        SizedBox(height: 15),
        SizedBox(
          height: 35.h,

          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            itemBuilder: (context, index) {
              return ProductItemTile(productItem: productList[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 12);
            },
            itemCount: productList.length,
          ),
        ),
      ],
    );
  }
}
