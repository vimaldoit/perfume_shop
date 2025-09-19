import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:perfume_shop/data/models/product_model.dart';
import 'package:perfume_shop/utils/colors.dart';
import 'package:sizer/sizer.dart';

class ProductItemTile extends StatelessWidget {
  final Products productItem;
  const ProductItemTile({super.key, required this.productItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderColor),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: CachedNetworkImage(
              imageUrl: productItem.image.toString(),
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              placeholder:
                  (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget:
                  (context, url, error) => Icon(
                    Icons.broken_image, // <-- The "broken image" icon here
                    color: Colors.grey[600],
                  ),
            ),
          ),
          SizedBox(height: 2),
          Text(
            productItem.name ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 2),
          Text.rich(
            textAlign: TextAlign.justify,
            TextSpan(
              children: [
                TextSpan(
                  text: productItem.currency ?? "",
                  style: TextStyle(
                    color: AppColors.hintColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                TextSpan(
                  text: productItem.actualPrice,
                  style: TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2),
          Text.rich(
            textAlign: TextAlign.justify,
            TextSpan(
              children: [
                TextSpan(
                  text: productItem.currency ?? "",
                  style: TextStyle(
                    color: AppColors.hintColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                TextSpan(
                  text: productItem.actualPrice,
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: productItem.unit ?? "",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2),
          Row(
            children: [
              SizedBox(
                height: 35,
                child: ElevatedButton(
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    elevation: 0,

                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: AppColors.borderColor),
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.textColor,
                    alignment: Alignment.center,
                  ),
                  child: Text(
                    "RFQ",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
