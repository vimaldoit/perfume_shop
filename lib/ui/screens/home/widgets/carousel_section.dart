import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:perfume_shop/data/models/carousel_item_model.dart';

class CarouselSec extends StatelessWidget {
  final List<CarouselItems> carouseldata;
  const CarouselSec({super.key, required this.carouseldata});

  @override
  Widget build(BuildContext context) {
    return carouseldata.isNotEmpty
        ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 20),

              CarouselSlider(
                options: CarouselOptions(
                  height: 160,
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

                    child: Image.network(
                      cdata.image.toString(),
                      fit: BoxFit.fill,
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
