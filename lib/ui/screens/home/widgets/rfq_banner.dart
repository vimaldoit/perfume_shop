import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:perfume_shop/utils/colors.dart';
import 'package:sizer/sizer.dart';

class RfqBanner extends StatelessWidget {
  final String imgUrl;
  const RfqBanner({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        children: [
          SizedBox(height: 20),
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: imgUrl,
                width: double.infinity,
                height: 20.h,
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

              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAlias,
                width: double.infinity,
                height: 20.h,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Request for quote',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                      height: 5.h,
                      child: ElevatedButton(
                        onPressed: () {},

                        style: ElevatedButton.styleFrom(
                          elevation: 0,

                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          backgroundColor: AppColors.backgroundColor,
                          foregroundColor: AppColors.textColor,
                          alignment: Alignment.center,
                        ),
                        child: Text(
                          "Create RFQ",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
