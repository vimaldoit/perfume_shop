import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:perfume_shop/data/models/banner_model.dart';
import 'package:perfume_shop/data/models/brand_model.dart';
import 'package:perfume_shop/data/models/carousel_item_model.dart';
import 'package:perfume_shop/data/models/categories_model.dart';
import 'package:perfume_shop/data/models/product_model.dart';
import 'package:perfume_shop/ui/common_widgets/app_loader.dart';
import 'package:perfume_shop/ui/common_widgets/heading_with_view_sec.dart';
import 'package:perfume_shop/ui/common_widgets/notification_with_badge.dart';
import 'package:perfume_shop/ui/screens/home/home_bloc.dart';
import 'package:perfume_shop/ui/screens/home/widgets/banner_grid_section.dart';
import 'package:perfume_shop/ui/screens/home/widgets/brands_section.dart';
import 'package:perfume_shop/ui/screens/home/widgets/carousel_section.dart';
import 'package:perfume_shop/ui/screens/home/widgets/cartegory_section.dart';
import 'package:perfume_shop/ui/screens/home/widgets/image_banner.dart';
import 'package:perfume_shop/ui/screens/home/widgets/product_collection_sec.dart';
import 'package:perfume_shop/ui/screens/home/widgets/product_item_tile.dart';
import 'package:perfume_shop/ui/screens/home/widgets/rfq_banner.dart';

import 'package:perfume_shop/utils/colors.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomeLoading) {
              return AppLoader();
            }
            if (state is HomeSuccess) {
              final homeData = state.homedata.data;

              final homeFields = homeData?.homeFields ?? [];

              return Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 4.w,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text.rich(
                                textAlign: TextAlign.justify,
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Welcome, ",
                                      style: TextStyle(
                                        color: AppColors.textColor,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "User!",
                                      style: TextStyle(
                                        color: AppColors.textColor,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              NotificationWithBadge(
                                count: homeData?.notificationCount ?? 0,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),

                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 5.h,
                                  child: TextFormField(
                                    textAlign: TextAlign.left,
                                    cursorColor: Colors.black,

                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10),
                                      hintText: "Search..",
                                      hintStyle: TextStyle(
                                        color: AppColors.hintColor,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: AppColors.greyColor,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide(
                                          color: AppColors.borderColor,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide(
                                          color: AppColors.borderColor,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide(
                                          color: AppColors.borderColor,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              SizedBox(
                                height: 5.h,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 10,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    backgroundColor: AppColors.buttonColor,
                                    foregroundColor: AppColors.backgroundColor,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Scan Here",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      SizedBox(
                                        height: 20,
                                        width: 25,
                                        child: Image.asset(
                                          'assets/images/barcode_image.png',
                                          fit: BoxFit.cover,
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
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: homeFields.length,
                      itemBuilder: (context, index) {
                        final item = homeFields[index];
                        switch (item.type) {
                          case 'carousel':
                            return CarouselSec(
                              carouseldata: item.carouselItems ?? [],
                            );
                          case 'brands':
                            return BrandSec(brandsData: item.brands ?? []);
                          case 'category':
                            return CategorySec(
                              categories: item.categories ?? [],
                            );
                          case 'rfq':
                            return RfqBanner(imgUrl: item.image ?? "");
                          case 'collection':
                            return ProductCollectionSec(
                              productList: item.products ?? [],
                              title: item.name ?? "",
                            );
                          case 'banner-grid':
                            return BannerGridSec(banners: item.banners ?? []);
                          case 'banner':
                            return ImageBanner(
                              imgUrl: item.banner?.image ?? "",
                            );

                          default:
                            return SizedBox.shrink();
                        }
                      },
                    ),
                  ),
                ],
              );
            }
            if (state is HomeFailure) {
              return Center(
                child: Text(
                  state.error,
                  style: TextStyle(
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
