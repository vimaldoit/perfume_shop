import 'package:flutter/material.dart';
import 'package:perfume_shop/data/models/product_model.dart';
import 'package:perfume_shop/ui/common_widgets/heading_with_view_sec.dart';
import 'package:perfume_shop/ui/screens/home/widgets/product_item_tile.dart';
import 'package:perfume_shop/utils/colors.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(height: 20),
          HeadingWithViewSec(heading: title, onPressed: () {}),
          SizedBox(height: 15),
          SizedBox(
            height: 180,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductItemTile(productItem: productList[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 20);
              },
              itemCount: productList.length,
            ),
          ),
        ],
      ),
    );
  }
}
