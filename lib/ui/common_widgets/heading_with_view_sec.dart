import 'package:flutter/material.dart';
import 'package:perfume_shop/utils/colors.dart';
import 'package:sizer/sizer.dart';

class HeadingWithViewSec extends StatelessWidget {
  final String heading;
  final VoidCallback onPressed;
  const HeadingWithViewSec({
    super.key,
    required this.heading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 19.sp,
            fontWeight: FontWeight.w600,
          ),
        ),

        InkWell(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.only(bottom: 0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.textColor, width: 0.5),
              ),
            ),
            child: Text(
              "View All",
              style: TextStyle(
                fontSize: 16.sp,
                height: 1.2,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
