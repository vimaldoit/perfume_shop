import 'package:flutter/material.dart';
import 'package:perfume_shop/utils/colors.dart';
import 'package:sizer/sizer.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 100.w,
      height: 100.h,
      child: Center(
        child: CircularProgressIndicator(color: AppColors.buttonColor),
      ),
    );
  }
}
