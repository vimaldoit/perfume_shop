import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:perfume_shop/ui/common_widgets/app_loader.dart';
import 'package:perfume_shop/ui/common_widgets/heading_with_view_sec.dart';
import 'package:perfume_shop/ui/screens/home/home_bloc.dart';
import 'package:perfume_shop/ui/screens/home/widgets/silding_banner.dart';
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
              var homeData = state.homedata.data;
              var carouseldata = homeData?.homeFields?.first.carouselItems;
              return Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
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
                                      text: "Vimal!",
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
                              Icon(
                                Icons.notifications_outlined,
                                color: AppColors.textColor,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),

                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 40,
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
                                height: 40,
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 160,
                            autoPlay: true,
                            enlargeCenterPage: false,
                            viewportFraction: 1.0,
                            //autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                          ),
                          items: List<Widget>.generate(carouseldata!.length, (
                            int index,
                          ) {
                            var cdata = carouseldata[index];
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    cdata.image.toString(),
                                    width: double.infinity,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 20),
                        HeadingWithViewSec(
                          heading: "Shop by brands",
                          onPressed: () {},
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                color: Colors.black,
                                height: 50,
                                width: 50,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 20);
                            },
                            itemCount: 10,
                          ),
                        ),
                      ],
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
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
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
