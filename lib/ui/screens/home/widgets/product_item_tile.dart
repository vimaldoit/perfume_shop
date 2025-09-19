import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:perfume_shop/data/models/product_model.dart';
import 'package:perfume_shop/utils/colors.dart';
import 'package:sizer/sizer.dart';

class ProductItemTile extends StatefulWidget {
  final Products productItem;
  const ProductItemTile({super.key, required this.productItem});

  @override
  State<ProductItemTile> createState() => _ProductItemTileState();
}

class _ProductItemTileState extends State<ProductItemTile> {
  bool isfavFlag = false;
  int cartCount = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isfavFlag = widget.productItem.wishlisted ?? false;
    cartCount = widget.productItem.cartCount ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderColor),
      ),

      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(2.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: widget.productItem.image.toString(),
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) =>
                          Center(child: CircularProgressIndicator()),
                  errorWidget:
                      (context, url, error) => Icon(
                        Icons.broken_image,
                        color: AppColors.greyColor,
                        size: 70,
                      ),
                ),
                SizedBox(height: 2.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productItem.name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 17.sp,
                        height: 1.2,
                      ),
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown, // scales down if too large
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              textAlign: TextAlign.justify,
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: widget.productItem.currency ?? "",
                                    style: TextStyle(
                                      color: AppColors.greyColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        ' ${widget.productItem.actualPrice ?? ""}',
                                    style: TextStyle(
                                      color: AppColors.greyColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown, // scales down if too large
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              textAlign: TextAlign.justify,
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        '${widget.productItem.currency ?? ""}',
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${widget.productItem.price ?? ""}',
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${widget.productItem.unit ?? ""}',
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 35,
                          child: ElevatedButton(
                            onPressed: () {},

                            style: ElevatedButton.styleFrom(
                              elevation: 0,

                              minimumSize: Size(12.w, 40),
                              padding: EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 0,
                              ),
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
                        SizedBox(width: 5),
                        cartCount == 0
                            ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  cartCount = cartCount + 1;
                                });
                              },
                              child: Container(
                                height: 35,
                                alignment: Alignment.center,

                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 0,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.buttonColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Text(
                                  "Add to cart",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.buttonTextcolor,
                                  ),
                                ),
                              ),
                            )
                            : Expanded(
                              child: Container(
                                height: 35,
                                alignment: Alignment.center,

                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 0,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.buttonColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          if (cartCount > 0) {
                                            setState(() {
                                              cartCount = cartCount - 1;
                                            });
                                          }
                                        },
                                        icon: Icon(
                                          Icons.remove,
                                          color: AppColors.buttonTextcolor,
                                          size: 18,
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,

                                        child: Text(
                                          cartCount.toString(),
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.buttonTextcolor,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      width: 20,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          setState(() {
                                            cartCount = cartCount + 1;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: AppColors.buttonTextcolor,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          Positioned(
            top: 8,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.lightGreyColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Text(
                widget.productItem.offer ?? "", // You can make this dynamic
                style: TextStyle(
                  color: AppColors.offerTextColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            top: 12,
            right: 8,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isfavFlag = !isfavFlag;
                });
              },
              child:
                  isfavFlag
                      ? Icon(
                        Icons.favorite,
                        color: AppColors.buttonColor,
                        size: 20,
                      )
                      : Icon(
                        Icons.favorite_border,
                        color: AppColors.textColor,
                        size: 20,
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
