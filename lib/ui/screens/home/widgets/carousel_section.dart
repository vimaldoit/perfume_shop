import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:perfume_shop/data/models/carousel_item_model.dart';
import 'package:perfume_shop/utils/colors.dart';
import 'package:sizer/sizer.dart';

class CarouselSec extends StatelessWidget {
  final List<CarouselItems> carouseldata;
  const CarouselSec({super.key, required this.carouseldata});

  @override
  Widget build(BuildContext context) {
    return carouseldata.isNotEmpty
        ? Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              SizedBox(height: 20),

              CarouselSlider(
                options: CarouselOptions(
                  height: 20.h,
                  autoPlay: true,
                  enlargeCenterPage: false,
                  viewportFraction: 1.0,
                  //autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                ),
                items: List<Widget>.generate(carouseldata!.length, (int index) {
                  var cdata = carouseldata[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.antiAlias,

                    child: CachedNetworkImage(
                      imageUrl: cdata.image.toString(),

                      fit: BoxFit.fill,
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
                  );
                }),
              ),
            ],
          ),
        )
        : SizedBox();
  }
}
